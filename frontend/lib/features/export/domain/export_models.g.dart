// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExportHistoryItemImpl _$$ExportHistoryItemImplFromJson(
        Map<String, dynamic> json) =>
    _$ExportHistoryItemImpl(
      id: json['id'] as String,
      format: $enumDecode(_$ExportFormatEnumMap, json['format']),
      date: DateTime.parse(json['date'] as String),
      periodDescription: json['periodDescription'] as String,
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
    );

Map<String, dynamic> _$$ExportHistoryItemImplToJson(
        _$ExportHistoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'format': _$ExportFormatEnumMap[instance.format]!,
      'date': instance.date.toIso8601String(),
      'periodDescription': instance.periodDescription,
      'fileName': instance.fileName,
      'filePath': instance.filePath,
    };

const _$ExportFormatEnumMap = {
  ExportFormat.pdf: 'pdf',
  ExportFormat.csv: 'csv',
  ExportFormat.excel: 'excel',
};
