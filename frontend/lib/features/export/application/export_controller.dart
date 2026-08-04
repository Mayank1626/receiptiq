import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../domain/export_models.dart';
import '../data/export_repository.dart';
import '../../history/application/history_controller.dart';
import '../../analytics/application/analytics_controller.dart';
import '../../households/application/household_controller.dart';

final exportHistoryProvider = StateProvider<List<ExportHistoryItem>>((ref) => []);
final exportJobProvider = StateProvider<ExportJob>((ref) => const ExportJob());

final exportControllerProvider = Provider<ExportController>((ref) {
  return ExportController(ref);
});

class ExportController {
  final Ref _ref;

  ExportController(this._ref);

  Future<void> generateReport(ExportRequest request) async {
    final jobNotifier = _ref.read(exportJobProvider.notifier);
    
    try {
      jobNotifier.state = const ExportJob(status: ExportJobStatus.preparing, progress: 0.1);
      
      // 1. Collect Data
      jobNotifier.state = const ExportJob(status: ExportJobStatus.collecting, progress: 0.3);
      await Future.delayed(const Duration(milliseconds: 500)); // Simulate work

      // For simplicity in this sprint, we just grab current cached data
      final historyState = _ref.read(historyControllerProvider);
      final receipts = historyState.maybeWhen(
        success: (data) => data.receipts, // We'd filter by period here in a real app
        orElse: () => [],
      );

      final analyticsState = _ref.read(analyticsControllerProvider);
      final analytics = analyticsState.maybeWhen(
        success: (data) => data.summary,
        orElse: () => null,
      );

      jobNotifier.state = const ExportJob(status: ExportJobStatus.building, progress: 0.5);
      
      final reportData = ReportData(
        request: request,
        receipts: receipts,
        analytics: analytics,
      );

      // 2. Generate File
      jobNotifier.state = const ExportJob(status: ExportJobStatus.generating, progress: 0.7);
      
      final repo = _ref.read(exportRepositoryProvider);
      final fileName = _generateFileName(request);
      String filePath;

      switch (request.format) {
        case ExportFormat.pdf:
          filePath = await repo.generatePdf(reportData, fileName);
          break;
        case ExportFormat.csv:
          filePath = await repo.generateCsv(reportData, fileName);
          break;
        case ExportFormat.excel:
          filePath = await repo.generateExcel(reportData, fileName);
          break;
      }

      // 3. Save History
      jobNotifier.state = const ExportJob(status: ExportJobStatus.saving, progress: 0.9);
      final historyItem = ExportHistoryItem(
        id: const Uuid().v4(),
        format: request.format,
        date: DateTime.now(),
        periodDescription: request.period.name,
        fileName: fileName,
        filePath: filePath,
      );
      
      _ref.read(exportHistoryProvider.notifier).update((state) => [historyItem, ...state]);

      // 4. Complete
      jobNotifier.state = ExportJob(status: ExportJobStatus.completed, generatedFilePath: filePath, progress: 1.0);

    } catch (e) {
      jobNotifier.state = ExportJob(status: ExportJobStatus.failed, errorMessage: e.toString());
    }
  }

  Future<void> shareLastReport() async {
    final job = _ref.read(exportJobProvider);
    if (job.status == ExportJobStatus.completed && job.generatedFilePath != null) {
      await _ref.read(exportRepositoryProvider).shareFile(job.generatedFilePath!, 'Here is my ReceiptIQ report.');
    }
  }

  Future<void> printLastReport() async {
    final job = _ref.read(exportJobProvider);
    if (job.status == ExportJobStatus.completed && job.generatedFilePath != null) {
      await _ref.read(exportRepositoryProvider).printPdf(job.generatedFilePath!);
    }
  }

  void resetJob() {
    _ref.read(exportJobProvider.notifier).state = const ExportJob();
  }

  String _generateFileName(ExportRequest request) {
    final date = DateTime.now();
    final format = request.format.name.toUpperCase();
    final period = request.period.name.toUpperCase();
    return 'ReceiptIQ_${format}_${period}_${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2, '0')}';
  }
}
