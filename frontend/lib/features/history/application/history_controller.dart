import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/storage/storage_service.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import '../domain/history_models.dart';
import '../data/history_repository.dart';

final historyRepositoryProvider = Provider<HistoryRepository>((ref) {
  return HistoryRepository(ref.watch(apiClientProvider));
});

final historyControllerProvider = NotifierProvider.autoDispose<HistoryController, HistoryState>(() {
  return HistoryController();
});

class HistoryController extends AutoDisposeNotifier<HistoryState> {
  late HistoryRepository _repository;
  late StorageService _storage;
  static const int _limit = 20;
  static const String _cacheKey = 'history_first_page_cache';
  Timer? _debounce;

  @override
  HistoryState build() {
    _repository = ref.watch(historyRepositoryProvider);
    _storage = ref.watch(storageServiceProvider);

    // Don't await in build, start loading asynchronously
    Future.microtask(() => _loadInitial());

    return const HistoryState();
  }

  Future<void> _loadInitial() async {
    // 1. Try to load from cache if no filters are applied (default state)
    if (state.filter == const ReceiptFilter()) {
      final cached = _storage.getString(_cacheKey);
      if (cached != null) {
        try {
          final list = (jsonDecode(cached) as List).map((e) => ReceiptModel.fromJson(e)).toList();
          state = state.copyWith(
            items: list,
            isFirstLoad: false,
            hasReachedEnd: list.length < _limit,
          );
        } catch (_) {}
      }
    }

    // 2. Load fresh from network
    await _fetchPage(isRefresh: true);
  }

  Future<void> refresh() async {
    await _fetchPage(isRefresh: true);
  }

  void updateFilter(ReceiptFilter newFilter) {
    if (state.filter == newFilter) return;

    state = state.copyWith(filter: newFilter);

    // Debounce the network request by 300ms
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _fetchPage(isRefresh: true);
    });
  }

  Future<void> loadNextPage() async {
    if (state.isLoadingMore || state.hasReachedEnd || state.isFirstLoad) return;
    
    state = state.copyWith(isLoadingMore: true);
    await _fetchPage(isRefresh: false);
  }

  Future<void> _fetchPage({required bool isRefresh}) async {
    if (isRefresh) {
      state = state.copyWith(isFirstLoad: state.items.isEmpty, error: null);
    }

    final skip = isRefresh ? 0 : state.items.length;
    
    final result = await _repository.getReceipts(
      skip: skip,
      limit: _limit,
      filter: state.filter,
    );

    result.when(
      success: (newItems) {
        final items = isRefresh ? newItems : [...state.items, ...newItems];
        final hasReachedEnd = newItems.length < _limit;

        state = state.copyWith(
          items: items,
          isFirstLoad: false,
          isLoadingMore: false,
          hasReachedEnd: hasReachedEnd,
          error: null,
        );

        // Cache if it's a refresh without active filters
        if (isRefresh && state.filter == const ReceiptFilter()) {
          _storage.saveString(_cacheKey, jsonEncode(items.map((e) => e.toJson()).toList()));
        }
      },
      failure: (failure) {
        state = state.copyWith(
          error: failure,
          isFirstLoad: false,
          isLoadingMore: false,
        );
      },
    );
  }
}
