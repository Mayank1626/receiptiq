import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';

import '../domain/export_models.dart';

final exportRepositoryProvider = Provider<ExportRepository>((ref) {
  return ExportRepository();
});

class ExportRepository {
  final _currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
  final _dateFormat = DateFormat('yyyy-MM-dd');

  Future<String> generatePdf(ReportData data, String fileName) async {
    final pdf = pw.Document();

    // Cover Page
    pdf.addPage(pw.Page(
      build: (context) => _buildPdfCoverPage(data),
    ));

    // Executive Summary
    if (data.request.includeSummary) {
      pdf.addPage(pw.Page(
        build: (context) => _buildPdfSummary(data),
      ));
    }

    // Receipt Ledger
    if (data.request.includeReceipts && data.receipts.isNotEmpty) {
      // Chunk receipts into pages of 20
      final chunks = _chunkList(data.receipts, 20);
      for (int i = 0; i < chunks.length; i++) {
        pdf.addPage(pw.Page(
          build: (context) => _buildPdfReceiptLedger(chunks[i], i + 1, chunks.length),
        ));
      }
    }

    final output = await _getTempDirectory();
    final file = File('${output.path}/$fileName.pdf');
    await file.writeAsBytes(await pdf.save());
    return file.path;
  }

  Future<String> generateCsv(ReportData data, String fileName) async {
    List<List<dynamic>> rows = [];
    
    // Header
    rows.add([
      'Receipt ID', 'Date', 'Store', 'Category', 'Subtotal', 'Tax', 'Discount', 'Delivery', 'Total', 'Status'
    ]);

    for (var r in data.receipts) {
      rows.add([
        r.id,
        r.date != null ? _dateFormat.format(r.date!) : '',
        r.storeName ?? 'Unknown',
        r.category ?? 'Uncategorized',
        r.subtotal ?? 0,
        r.taxAmount ?? 0,
        r.discountAmount ?? 0,
        r.deliveryAmount ?? 0,
        r.totalAmount ?? 0,
        r.status.name,
      ]);
    }

    String csv = const ListToCsvConverter().convert(rows);
    final output = await _getTempDirectory();
    final file = File('${output.path}/$fileName.csv');
    await file.writeAsString(csv);
    return file.path;
  }

  Future<String> generateExcel(ReportData data, String fileName) async {
    var excel = Excel.createExcel();
    
    // Receipts Sheet
    Sheet sheetObject = excel['Receipts'];
    excel.setDefaultSheet('Receipts');
    
    sheetObject.appendRow([
      TextCellValue('Receipt ID'), TextCellValue('Date'), TextCellValue('Store'), TextCellValue('Total')
    ]);

    for (var r in data.receipts) {
      sheetObject.appendRow([
        TextCellValue(r.id),
        TextCellValue(r.date != null ? _dateFormat.format(r.date!) : ''),
        TextCellValue(r.storeName ?? 'Unknown'),
        DoubleCellValue(r.totalAmount ?? 0.0),
      ]);
    }

    // Analytics Sheet
    if (data.analytics != null) {
      Sheet analyticsSheet = excel['Summary'];
      analyticsSheet.appendRow([TextCellValue('Metric'), TextCellValue('Value')]);
      analyticsSheet.appendRow([TextCellValue('Total Spend'), DoubleCellValue(data.analytics!.totalSpend)]);
      analyticsSheet.appendRow([TextCellValue('Total Receipts'), IntCellValue(data.analytics!.totalReceipts)]);
    }

    final output = await _getTempDirectory();
    final file = File('${output.path}/$fileName.xlsx');
    final bytes = excel.save();
    if (bytes != null) {
      await file.writeAsBytes(bytes);
    }
    return file.path;
  }

  Future<void> shareFile(String filePath, String text) async {
    await Share.shareXFiles([XFile(filePath)], text: text);
  }

  Future<void> printPdf(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      await Printing.layoutPdf(onLayout: (_) => bytes);
    }
  }

  // --- PDF Builders ---

  pw.Widget _buildPdfCoverPage(ReportData data) {
    return pw.Center(
      child: pw.Column(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Text('ReceiptIQ', style: pw.TextStyle(fontSize: 40, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 20),
          pw.Text('Expense Report', style: pw.TextStyle(fontSize: 24)),
          pw.SizedBox(height: 10),
          pw.Text('Period: ${data.request.period.name.toUpperCase()}'),
          pw.SizedBox(height: 40),
          pw.Text('Generated on: ${_dateFormat.format(DateTime.now())}'),
        ],
      ),
    );
  }

  pw.Widget _buildPdfSummary(ReportData data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Executive Summary', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 20),
        if (data.analytics != null) ...[
          _buildSummaryRow('Total Spend', _currencyFormat.format(data.analytics!.totalSpend)),
          _buildSummaryRow('Total Receipts', data.analytics!.totalReceipts.toString()),
        ] else ...[
          pw.Text('No analytics data available for this period.'),
        ],
      ],
    );
  }

  pw.Widget _buildSummaryRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 8),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: pw.TextStyle(fontSize: 14)),
          pw.Text(value, style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        ],
      ),
    );
  }

  pw.Widget _buildPdfReceiptLedger(List<ReceiptModel> chunk, int page, int totalPages) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Receipt Ledger', style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 10),
        pw.TableHelper.fromTextArray(
          headers: ['Date', 'Store', 'Category', 'Total'],
          data: chunk.map((r) => [
            r.date != null ? _dateFormat.format(r.date!) : '-',
            r.storeName ?? 'Unknown',
            r.category ?? '-',
            _currencyFormat.format(r.totalAmount ?? 0),
          ]).toList(),
        ),
        pw.Spacer(),
        pw.Align(
          alignment: pw.Alignment.bottomRight,
          child: pw.Text('Page $page of $totalPages', style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
        )
      ],
    );
  }

  // --- Helpers ---

  Future<Directory> _getTempDirectory() async {
    return await getTemporaryDirectory();
  }

  List<List<T>> _chunkList<T>(List<T> list, int chunkSize) {
    List<List<T>> chunks = [];
    for (var i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }
}
