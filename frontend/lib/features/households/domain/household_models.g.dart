// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdMemberModelImpl _$$HouseholdMemberModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdMemberModelImpl(
      userId: json['user_id'] as String,
      role: $enumDecode(_$HouseholdRoleEnumMap, json['role']),
      email: json['email'] as String,
      joinedAt: DateTime.parse(json['joined_at'] as String),
    );

Map<String, dynamic> _$$HouseholdMemberModelImplToJson(
        _$HouseholdMemberModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role': _$HouseholdRoleEnumMap[instance.role]!,
      'email': instance.email,
      'joined_at': instance.joinedAt.toIso8601String(),
    };

const _$HouseholdRoleEnumMap = {
  HouseholdRole.owner: 'owner',
  HouseholdRole.admin: 'admin',
  HouseholdRole.member: 'member',
};

_$HouseholdModelImpl _$$HouseholdModelImplFromJson(Map<String, dynamic> json) =>
    _$HouseholdModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) =>
                  HouseholdMemberModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HouseholdModelImplToJson(
        _$HouseholdModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'members': instance.members,
    };

_$WorkspaceImpl _$$WorkspaceImplFromJson(Map<String, dynamic> json) =>
    _$WorkspaceImpl(
      type: $enumDecodeNullable(_$WorkspaceTypeEnumMap, json['type']) ??
          WorkspaceType.personal,
      householdId: json['householdId'] as String?,
      householdName: json['householdName'] as String?,
    );

Map<String, dynamic> _$$WorkspaceImplToJson(_$WorkspaceImpl instance) =>
    <String, dynamic>{
      'type': _$WorkspaceTypeEnumMap[instance.type]!,
      'householdId': instance.householdId,
      'householdName': instance.householdName,
    };

const _$WorkspaceTypeEnumMap = {
  WorkspaceType.personal: 'personal',
  WorkspaceType.household: 'household',
};
