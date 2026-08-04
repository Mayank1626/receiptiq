import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';
import 'package:receiptiq_mobile/core/storage/storage_service.dart';
import '../domain/household_models.dart';
import '../data/household_repository.dart';

final householdRepositoryProvider = Provider<HouseholdRepository>((ref) {
  return HouseholdRepository(ref.watch(apiClientProvider));
});

final householdControllerProvider = NotifierProvider<HouseholdController, HouseholdState>(() {
  return HouseholdController();
});

class HouseholdController extends Notifier<HouseholdState> {
  late HouseholdRepository _repository;
  late StorageService _storage;
  static const String _workspaceCacheKey = 'active_workspace';

  @override
  HouseholdState build() {
    _repository = ref.watch(householdRepositoryProvider);
    _storage = ref.watch(storageServiceProvider);

    // Load active workspace from cache
    Workspace activeWorkspace = const Workspace();
    final cached = _storage.getString(_workspaceCacheKey);
    if (cached != null) {
      try {
        activeWorkspace = Workspace.fromJson(jsonDecode(cached));
      } catch (_) {}
    }

    // Load households asynchronously
    Future.microtask(() => load());

    return HouseholdState(activeWorkspace: activeWorkspace);
  }

  Future<void> load() async {
    state = state.copyWith(households: const ApiState.loading());
    final result = await _repository.getHouseholds();
    result.when(
      success: (data) => state = state.copyWith(households: ApiState.loaded(data)),
      failure: (failure) => state = state.copyWith(households: ApiState.error(failure)),
    );
  }

  Future<void> refresh() async {
    final result = await _repository.getHouseholds();
    if (result.isSuccess) {
      state = state.copyWith(households: ApiState.loaded(result.getSuccess()!));
    }
  }

  void switchWorkspace(Workspace newWorkspace) {
    if (state.activeWorkspace == newWorkspace) return;
    
    state = state.copyWith(activeWorkspace: newWorkspace);
    _storage.saveString(_workspaceCacheKey, jsonEncode(newWorkspace.toJson()));
    
    // Invalidate necessary providers to force refresh
    // Note: this is typically done by watching householdControllerProvider.select((s) => s.activeWorkspace)
    // in the other controllers, but can also be manually invalidated here if preferred.
  }

  Future<bool> createHousehold(String name) async {
    state = state.copyWith(isCreating: true);
    final result = await _repository.createHousehold(name);
    state = state.copyWith(isCreating: false);

    return result.when(
      success: (household) {
        final currentHouseholds = state.households.maybeWhen(
          loaded: (data) => data,
          orElse: () => <HouseholdModel>[],
        );
        state = state.copyWith(
          households: ApiState.loaded([...currentHouseholds, household]),
        );
        
        // Auto-switch to new household
        switchWorkspace(Workspace(
          type: WorkspaceType.household,
          householdId: household.id,
          householdName: household.name,
        ));
        return true;
      },
      failure: (failure) {
        // Normally show a snackbar here or return failure
        return false;
      },
    );
  }

  Future<bool> inviteMember(String householdId, String email, HouseholdRole role) async {
    state = state.copyWith(isInviting: true);
    final result = await _repository.inviteMember(householdId, email, role);
    state = state.copyWith(isInviting: false);
    return result.isSuccess;
  }
}
