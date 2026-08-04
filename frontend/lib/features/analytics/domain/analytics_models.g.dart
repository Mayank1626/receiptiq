// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusCountsImpl _$$StatusCountsImplFromJson(Map<String, dynamic> json) =>
    _$StatusCountsImpl(
      draft: (json['draft'] as num?)?.toInt() ?? 0,
      reviewRequired: (json['review_required'] as num?)?.toInt() ?? 0,
      confirmed: (json['confirmed'] as num?)?.toInt() ?? 0,
      failed: (json['failed'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$StatusCountsImplToJson(_$StatusCountsImpl instance) =>
    <String, dynamic>{
      'draft': instance.draft,
      'review_required': instance.reviewRequired,
      'confirmed': instance.confirmed,
      'failed': instance.failed,
    };

_$DashboardMetricsImpl _$$DashboardMetricsImplFromJson(
        Map<String, dynamic> json) =>
    _$DashboardMetricsImpl(
      totalReceipts: (json['total_receipts'] as num).toInt(),
      totalSpend: (json['total_spend'] as num).toDouble(),
      averageReceipt: (json['average_receipt'] as num).toDouble(),
      largestReceipt: (json['largest_receipt'] as num).toDouble(),
      smallestReceipt: (json['smallest_receipt'] as num).toDouble(),
      statusCounts:
          StatusCounts.fromJson(json['status_counts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardMetricsImplToJson(
        _$DashboardMetricsImpl instance) =>
    <String, dynamic>{
      'total_receipts': instance.totalReceipts,
      'total_spend': instance.totalSpend,
      'average_receipt': instance.averageReceipt,
      'largest_receipt': instance.largestReceipt,
      'smallest_receipt': instance.smallestReceipt,
      'status_counts': instance.statusCounts,
    };

_$MonthlySpendImpl _$$MonthlySpendImplFromJson(Map<String, dynamic> json) =>
    _$MonthlySpendImpl(
      month: json['month'] as String,
      totalSpend: (json['total_spend'] as num).toDouble(),
      receiptCount: (json['receipt_count'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthlySpendImplToJson(_$MonthlySpendImpl instance) =>
    <String, dynamic>{
      'month': instance.month,
      'total_spend': instance.totalSpend,
      'receipt_count': instance.receiptCount,
    };

_$StoreAnalyticsImpl _$$StoreAnalyticsImplFromJson(Map<String, dynamic> json) =>
    _$StoreAnalyticsImpl(
      storeName: json['store_name'] as String,
      totalSpend: (json['total_spend'] as num).toDouble(),
      visitCount: (json['visit_count'] as num).toInt(),
      averageSpend: (json['average_spend'] as num).toDouble(),
      lastVisit: json['last_visit'] == null
          ? null
          : DateTime.parse(json['last_visit'] as String),
    );

Map<String, dynamic> _$$StoreAnalyticsImplToJson(
        _$StoreAnalyticsImpl instance) =>
    <String, dynamic>{
      'store_name': instance.storeName,
      'total_spend': instance.totalSpend,
      'visit_count': instance.visitCount,
      'average_spend': instance.averageSpend,
      'last_visit': instance.lastVisit?.toIso8601String(),
    };

_$ProductAnalyticsImpl _$$ProductAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductAnalyticsImpl(
      itemName: json['item_name'] as String,
      totalQuantityPurchased:
          (json['total_quantity_purchased'] as num).toDouble(),
      totalSpend: (json['total_spend'] as num).toDouble(),
      averagePrice: (json['average_price'] as num).toDouble(),
      percentagePriceTrend:
          (json['percentage_price_trend'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ProductAnalyticsImplToJson(
        _$ProductAnalyticsImpl instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'total_quantity_purchased': instance.totalQuantityPurchased,
      'total_spend': instance.totalSpend,
      'average_price': instance.averagePrice,
      'percentage_price_trend': instance.percentagePriceTrend,
    };

_$PriceHistoryImpl _$$PriceHistoryImplFromJson(Map<String, dynamic> json) =>
    _$PriceHistoryImpl(
      itemName: json['item_name'] as String,
      averagePrice: (json['average_price'] as num).toDouble(),
      minPrice: (json['min_price'] as num).toDouble(),
      maxPrice: (json['max_price'] as num).toDouble(),
      trend: json['trend'] as String,
      percentageChange: (json['percentage_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PriceHistoryImplToJson(_$PriceHistoryImpl instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'average_price': instance.averagePrice,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'trend': instance.trend,
      'percentage_change': instance.percentageChange,
    };

_$CategoryAnalyticsImpl _$$CategoryAnalyticsImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryAnalyticsImpl(
      categoryName: json['category_name'] as String,
      totalSpend: (json['total_spend'] as num).toDouble(),
      itemCount: (json['item_count'] as num).toInt(),
      receiptCount: (json['receipt_count'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryAnalyticsImplToJson(
        _$CategoryAnalyticsImpl instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'total_spend': instance.totalSpend,
      'item_count': instance.itemCount,
      'receipt_count': instance.receiptCount,
    };

_$DailyTimelineImpl _$$DailyTimelineImplFromJson(Map<String, dynamic> json) =>
    _$DailyTimelineImpl(
      date: DateTime.parse(json['date'] as String),
      totalSpend: (json['total_spend'] as num).toDouble(),
      receiptCount: (json['receipt_count'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyTimelineImplToJson(_$DailyTimelineImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'total_spend': instance.totalSpend,
      'receipt_count': instance.receiptCount,
    };

_$AnalyticsDashboardDataImpl _$$AnalyticsDashboardDataImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsDashboardDataImpl(
      metrics:
          DashboardMetrics.fromJson(json['metrics'] as Map<String, dynamic>),
      monthly: (json['monthly'] as List<dynamic>)
          .map((e) => MonthlySpend.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeline: (json['timeline'] as List<dynamic>)
          .map((e) => DailyTimeline.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => CategoryAnalytics.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreAnalytics.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductAnalytics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnalyticsDashboardDataImplToJson(
        _$AnalyticsDashboardDataImpl instance) =>
    <String, dynamic>{
      'metrics': instance.metrics,
      'monthly': instance.monthly,
      'timeline': instance.timeline,
      'categories': instance.categories,
      'stores': instance.stores,
      'products': instance.products,
    };
