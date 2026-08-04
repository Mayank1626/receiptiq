// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'split_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpenseShareBaseImpl _$$ExpenseShareBaseImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseShareBaseImpl(
      userId: json['user_id'] as String,
      amountPaid: (json['amount_paid'] as num?)?.toDouble() ?? 0.0,
      amountOwed: (json['amount_owed'] as num).toDouble(),
      percentageShare: (json['percentage_share'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ExpenseShareBaseImplToJson(
        _$ExpenseShareBaseImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'amount_paid': instance.amountPaid,
      'amount_owed': instance.amountOwed,
      'percentage_share': instance.percentageShare,
    };

_$ExpenseShareCreateImpl _$$ExpenseShareCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseShareCreateImpl(
      userId: json['user_id'] as String,
      amountPaid: (json['amount_paid'] as num?)?.toDouble() ?? 0.0,
      amountOwed: (json['amount_owed'] as num).toDouble(),
      percentageShare: (json['percentage_share'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ExpenseShareCreateImplToJson(
        _$ExpenseShareCreateImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'amount_paid': instance.amountPaid,
      'amount_owed': instance.amountOwed,
      'percentage_share': instance.percentageShare,
    };

_$ExpenseSplitCreateImpl _$$ExpenseSplitCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpenseSplitCreateImpl(
      splitType: $enumDecode(_$SplitTypeEnumMap, json['split_type']),
      shares: (json['shares'] as List<dynamic>)
          .map((e) => ExpenseShareCreate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExpenseSplitCreateImplToJson(
        _$ExpenseSplitCreateImpl instance) =>
    <String, dynamic>{
      'split_type': _$SplitTypeEnumMap[instance.splitType]!,
      'shares': instance.shares,
    };

const _$SplitTypeEnumMap = {
  SplitType.equal: 'equal',
  SplitType.percentage: 'percentage',
  SplitType.fixed: 'fixed',
};

_$UserBalanceImpl _$$UserBalanceImplFromJson(Map<String, dynamic> json) =>
    _$UserBalanceImpl(
      userId: json['user_id'] as String,
      netBalance: (json['net_balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$UserBalanceImplToJson(_$UserBalanceImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'net_balance': instance.netBalance,
    };

_$SuggestedSettlementResponseImpl _$$SuggestedSettlementResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SuggestedSettlementResponseImpl(
      payerId: json['payer_id'] as String,
      payeeId: json['payee_id'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$SuggestedSettlementResponseImplToJson(
        _$SuggestedSettlementResponseImpl instance) =>
    <String, dynamic>{
      'payer_id': instance.payerId,
      'payee_id': instance.payeeId,
      'amount': instance.amount,
    };

_$SettlementCreateImpl _$$SettlementCreateImplFromJson(
        Map<String, dynamic> json) =>
    _$SettlementCreateImpl(
      payerId: json['payer_id'] as String,
      payeeId: json['payee_id'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$SettlementCreateImplToJson(
        _$SettlementCreateImpl instance) =>
    <String, dynamic>{
      'payer_id': instance.payerId,
      'payee_id': instance.payeeId,
      'amount': instance.amount,
    };

_$LedgerSplitEntryImpl _$$LedgerSplitEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LedgerSplitEntryImpl(
      id: json['id'] as String,
      receiptId: json['receipt_id'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      splitType: $enumDecode(_$SplitTypeEnumMap, json['split_type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LedgerSplitEntryImplToJson(
        _$LedgerSplitEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receipt_id': instance.receiptId,
      'total_amount': instance.totalAmount,
      'split_type': _$SplitTypeEnumMap[instance.splitType]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.$type,
    };

_$LedgerSettlementEntryImpl _$$LedgerSettlementEntryImplFromJson(
        Map<String, dynamic> json) =>
    _$LedgerSettlementEntryImpl(
      id: json['id'] as String,
      payerId: json['payer_id'] as String,
      payeeId: json['payee_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$$LedgerSettlementEntryImplToJson(
        _$LedgerSettlementEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payer_id': instance.payerId,
      'payee_id': instance.payeeId,
      'amount': instance.amount,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': instance.$type,
    };

_$LedgerResponseImpl _$$LedgerResponseImplFromJson(Map<String, dynamic> json) =>
    _$LedgerResponseImpl(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => LedgerEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LedgerResponseImplToJson(
        _$LedgerResponseImpl instance) =>
    <String, dynamic>{
      'entries': instance.entries,
    };
