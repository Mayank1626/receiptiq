import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';

part 'household_models.freezed.dart';
part 'household_models.g.dart';

enum HouseholdRole { owner, admin, member }

@freezed
class HouseholdMemberModel with _$HouseholdMemberModel {
  const factory HouseholdMemberModel({
    @JsonKey(name: 'user_id') required String userId,
    required HouseholdRole role,
    required String email,
    @JsonKey(name: 'joined_at') required DateTime joinedAt,
  }) = _HouseholdMemberModel;

  factory HouseholdMemberModel.fromJson(Map<String, dynamic> json) => _$HouseholdMemberModelFromJson(json);
}

@freezed
class HouseholdModel with _$HouseholdModel {
  const factory HouseholdModel({
    required String id,
    required String name,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @Default([]) List<HouseholdMemberModel> members,
  }) = _HouseholdModel;

  factory HouseholdModel.fromJson(Map<String, dynamic> json) => _$HouseholdModelFromJson(json);
}

enum WorkspaceType { personal, household }

@freezed
class Workspace with _$Workspace {
  const factory Workspace({
    @Default(WorkspaceType.personal) WorkspaceType type,
    String? householdId,
    String? householdName,
  }) = _Workspace;

  factory Workspace.fromJson(Map<String, dynamic> json) => _$WorkspaceFromJson(json);
}

@freezed
class HouseholdState with _$HouseholdState {
  const factory HouseholdState({
    @Default(ApiState.initial()) ApiState<List<HouseholdModel>> households,
    @Default(Workspace()) Workspace activeWorkspace,
    @Default(false) bool isCreating,
    @Default(false) bool isInviting,
  }) = _HouseholdState;
}
