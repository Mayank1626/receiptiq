// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_metrics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardMetricsImpl _$$DashboardMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardMetricsImpl(
      totalReceipts: (json['totalReceipts'] as num?)?.toInt() ?? 0,
      totalSpend: (json['totalSpend'] as num?)?.toDouble() ?? 0.0,
      averageReceipt: (json['averageReceipt'] as num?)?.toDouble() ?? 0.0,
      largestReceipt: (json['largestReceipt'] as num?)?.toDouble() ?? 0.0,
      smallestReceipt: (json['smallestReceipt'] as num?)?.toDouble() ?? 0.0,
      statusCounts:
          StatusCounts.fromJson(json['statusCounts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardMetricsImplToJson(
        _$DashboardMetricsImpl instance) =>
    <String, dynamic>{
      'totalReceipts': instance.totalReceipts,
      'totalSpend': instance.totalSpend,
      'averageReceipt': instance.averageReceipt,
      'largestReceipt': instance.largestReceipt,
      'smallestReceipt': instance.smallestReceipt,
      'statusCounts': instance.statusCounts,
    };

_$StatusCountsImpl _$$StatusCountsImplFromJson(Map<String, dynamic> json) =>
    _$StatusCountsImpl(
      draft: (json['draft'] as num?)?.toInt() ?? 0,
      reviewRequired: (json['reviewRequired'] as num?)?.toInt() ?? 0,
      confirmed: (json['confirmed'] as num?)?.toInt() ?? 0,
      failed: (json['failed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatusCountsImplToJson(_$StatusCountsImpl instance) =>
    <String, dynamic>{
      'draft': instance.draft,
      'reviewRequired': instance.reviewRequired,
      'confirmed': instance.confirmed,
      'failed': instance.failed,
    };
