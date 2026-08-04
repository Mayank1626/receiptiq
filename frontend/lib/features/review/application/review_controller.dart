import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_state.dart';
import '../../receipts/domain/receipt_model.dart';
import '../data/review_repository.dart';
import '../domain/review_models.dart';
import '../../dashboard/application/dashboard_controller.dart';
import 'package:uuid/uuid.dart';

final reviewRepositoryProvider = Provider<ReviewRepository>((ref) {
  return ReviewRepository(ref.watch(apiClientProvider));
});

final reviewControllerProvider = NotifierProvider.family.autoDispose<ReviewController, ApiState<ReviewStateData>, String>(() {
  return ReviewController();
});

class ReviewController extends AutoDisposeFamilyNotifier<ApiState<ReviewStateData>, String> {
  late ReviewRepository _repository;
  final _uuid = const Uuid();

  @override
  ApiState<ReviewStateData> build(String arg) {
    _repository = ref.watch(reviewRepositoryProvider);
    _load();
    return const ApiState.loading();
  }

  Future<void> _load() async {
    final result = await _repository.getReceipt(arg);
    state = result.when(
      success: (receipt) {
        return ApiState.success(ReviewStateData(
          originalReceipt: receipt,
          editedReceipt: receipt,
          hasUnsavedChanges: false,
        ));
      },
      failure: (failure) => ApiState.failure(failure),
    );
  }

  Future<void> refreshAudits() async {
    state.maybeWhen(
      success: (data) async {
        final auditResult = await _repository.getAuditHistory(arg);
        auditResult.whenOrNull(
          success: (audits) {
            state = ApiState.success(data.copyWith(auditHistory: audits));
          },
        );
      },
      orElse: () {},
    );
  }

  void updateField({
    String? storeName,
    DateTime? date,
    double? subtotal,
    double? tax,
    double? discount,
    double? deliveryCharge,
    double? totalAmount,
  }) {
    state.maybeWhen(
      success: (data) {
        var edited = data.editedReceipt.copyWith(
          storeName: storeName ?? data.editedReceipt.storeName,
          date: date ?? data.editedReceipt.date,
          subtotal: subtotal ?? data.editedReceipt.subtotal,
          tax: tax ?? data.editedReceipt.tax,
          discount: discount ?? data.editedReceipt.discount,
          deliveryCharge: deliveryCharge ?? data.editedReceipt.deliveryCharge,
          totalAmount: totalAmount ?? data.editedReceipt.totalAmount,
        );

        if (totalAmount == null && (subtotal != null || tax != null || discount != null || deliveryCharge != null)) {
           edited = edited.copyWith(totalAmount: _calculateTotal(edited));
        }

        state = ApiState.success(data.copyWith(
          editedReceipt: edited,
          hasUnsavedChanges: _hasChanges(data.originalReceipt, edited),
        ));
      },
      orElse: () {},
    );
  }

  void addItem(ReceiptItemModel item) {
    state.maybeWhen(
      success: (data) {
        final items = List<ReceiptItemModel>.from(data.editedReceipt.items);
        items.add(item.copyWith(id: 'local_${_uuid.v4()}'));
        
        var edited = data.editedReceipt.copyWith(items: items);
        edited = _autoUpdateTotalsFromItems(edited);
        
        state = ApiState.success(data.copyWith(
          editedReceipt: edited,
          hasUnsavedChanges: _hasChanges(data.originalReceipt, edited),
        ));
      },
      orElse: () {},
    );
  }

  void updateItem(ReceiptItemModel item) {
    state.maybeWhen(
      success: (data) {
        final items = data.editedReceipt.items.map((e) => e.id == item.id ? item : e).toList();
        
        var edited = data.editedReceipt.copyWith(items: items);
        edited = _autoUpdateTotalsFromItems(edited);
        
        state = ApiState.success(data.copyWith(
          editedReceipt: edited,
          hasUnsavedChanges: _hasChanges(data.originalReceipt, edited),
        ));
      },
      orElse: () {},
    );
  }

  ReceiptItemModel? deleteItem(String itemId) {
    final data = state.maybeWhen(success: (d) => d, orElse: () => null);
    if (data == null) return null;
    
    final index = data.editedReceipt.items.indexWhere((e) => e.id == itemId);
    if (index == -1) return null;
    final item = data.editedReceipt.items[index];

    final items = data.editedReceipt.items.where((e) => e.id != itemId).toList();
    
    var edited = data.editedReceipt.copyWith(items: items);
    edited = _autoUpdateTotalsFromItems(edited);
    
    state = ApiState.success(data.copyWith(
      editedReceipt: edited,
      hasUnsavedChanges: _hasChanges(data.originalReceipt, edited),
    ));
    
    return item;
  }

  void restoreItem(ReceiptItemModel item, {int? index}) {
    final data = state.maybeWhen(success: (d) => d, orElse: () => null);
    if (data == null) return;
    
    final items = List<ReceiptItemModel>.from(data.editedReceipt.items);
    if (index != null && index >= 0 && index <= items.length) {
      items.insert(index, item);
    } else {
      items.add(item);
    }
    
    var edited = data.editedReceipt.copyWith(items: items);
    edited = _autoUpdateTotalsFromItems(edited);
    
    state = ApiState.success(data.copyWith(
      editedReceipt: edited,
      hasUnsavedChanges: _hasChanges(data.originalReceipt, edited),
    ));
  }

  ReceiptModel _autoUpdateTotalsFromItems(ReceiptModel receipt) {
    double sub = 0;
    for (var item in receipt.items) {
      sub += item.totalPrice ?? ((item.itemPrice ?? 0) * item.quantity);
    }
    final edited = receipt.copyWith(subtotal: sub);
    return edited.copyWith(totalAmount: _calculateTotal(edited));
  }

  double _calculateTotal(ReceiptModel receipt) {
    return (receipt.subtotal ?? 0) + (receipt.tax ?? 0) + (receipt.deliveryCharge ?? 0) - (receipt.discount ?? 0);
  }

  bool _hasChanges(ReceiptModel original, ReceiptModel edited) {
    return original != edited;
  }

  Future<void> saveChanges() async {
    final data = state.maybeWhen(
      success: (d) => d,
      orElse: () => null,
    );
    if (data == null || !data.hasUnsavedChanges) return;
    
    final backup = data;
    
    // Optimistic update
    state = ApiState.success(data.copyWith(
      originalReceipt: data.editedReceipt,
      hasUnsavedChanges: false,
    ));
    
    try {
      final updateData = {
        if (data.originalReceipt.storeName != data.editedReceipt.storeName) 'store_name': data.editedReceipt.storeName,
        if (data.originalReceipt.date != data.editedReceipt.date) 'date': data.editedReceipt.date?.toIso8601String(),
        if (data.originalReceipt.subtotal != data.editedReceipt.subtotal) 'subtotal': data.editedReceipt.subtotal,
        if (data.originalReceipt.tax != data.editedReceipt.tax) 'tax': data.editedReceipt.tax,
        if (data.originalReceipt.deliveryCharge != data.editedReceipt.deliveryCharge) 'delivery_charge': data.editedReceipt.deliveryCharge,
        if (data.originalReceipt.discount != data.editedReceipt.discount) 'discount': data.editedReceipt.discount,
        if (data.originalReceipt.totalAmount != data.editedReceipt.totalAmount) 'total_amount': data.editedReceipt.totalAmount,
      };
      
      if (updateData.isNotEmpty) {
        final res = await _repository.updateReceipt(arg, updateData);
        if (res.isFailure) throw Exception('Failed to update receipt details');
      }

      final originalItems = {for (var i in data.originalReceipt.items) i.id: i};
      final editedItems = {for (var i in data.editedReceipt.items) i.id: i};
      
      for (final item in data.editedReceipt.items) {
        if (item.id.startsWith('local_')) {
          final res = await _repository.addItem(arg, {
            'name': item.name,
            'quantity': item.quantity,
            'item_price': item.itemPrice,
            'total_price': item.totalPrice,
            'category': item.category,
          });
          if (res.isFailure) throw Exception('Failed to add item');
        } else if (originalItems.containsKey(item.id) && originalItems[item.id] != item) {
          final res = await _repository.updateItem(arg, item.id, {
            'name': item.name,
            'quantity': item.quantity,
            'item_price': item.itemPrice,
            'total_price': item.totalPrice,
            'category': item.category,
          });
          if (res.isFailure) throw Exception('Failed to update item');
        }
      }
      
      for (final orig in data.originalReceipt.items) {
        if (!editedItems.containsKey(orig.id)) {
          final res = await _repository.deleteItem(arg, orig.id);
          if (res.isFailure) throw Exception('Failed to delete item');
        }
      }

      await _load();
    } catch (e) {
      // Revert optimistic changes
      state = ApiState.success(backup);
      rethrow;
    }
  }

  Future<bool> confirmReceipt() async {
    final data = state.maybeWhen(
      success: (d) => d,
      orElse: () => null,
    );
    if (data == null) return false;
    
    state = ApiState.success(data.copyWith(isConfirming: true));
    
    final result = await _repository.confirmReceipt(arg);
    
    return result.when(
      success: (_) {
        ref.read(dashboardControllerProvider.notifier).fetchData();
        return true;
      },
      failure: (f) {
        state = ApiState.success(data.copyWith(isConfirming: false));
        return false;
      }
    );
  }
}
