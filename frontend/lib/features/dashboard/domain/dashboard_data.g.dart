// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      metrics:
          DashboardMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      recentReceipts: (json['recentReceipts'] as List<dynamic>)
          .map((e) => ReceiptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      pendingReviews: (json['pendingReviews'] as List<dynamic>)
          .map((e) => ReceiptModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'metrics': instance.metrics,
      'recentReceipts': instance.recentReceipts,
      'pendingReviews': instance.pendingReviews,
    };
