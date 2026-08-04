import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'background_models.dart';
import 'background_service.dart';

final backgroundProcessingControllerProvider = NotifierProvider<BackgroundProcessingController, List<BackgroundProcessingJob>>(() {
  return BackgroundProcessingController();
});

class BackgroundProcessingController extends Notifier<List<BackgroundProcessingJob>> {
  @override
  List<BackgroundProcessingJob> build() {
    // In a full Hive implementation, we would load the jobs here.
    return [];
  }

  Future<void> enqueueJob(String filePath, String fileName) async {
    final jobId = DateTime.now().millisecondsSinceEpoch.toString();
    final newJob = BackgroundProcessingJob(
      id: jobId,
      filePath: filePath,
      state: ProcessingState.queued,
      createdAt: DateTime.now(),
    );
    
    state = [...state, newJob];
    
    // Register background worker
    await ref.read(backgroundServiceProvider).scheduleProcessingJob(jobId);

    // Simulate progress for UI demonstration since background isolates 
    // can't directly update Riverpod state without a persistent storage layer like Hive or Isolate ports.
    _simulateProgress(jobId);
  }

  void _simulateProgress(String jobId) async {
    final stages = [
      ProcessingState.uploading,
      ProcessingState.uploaded,
      ProcessingState.ocr,
      ProcessingState.ocrCompleted,
      ProcessingState.ai,
      ProcessingState.aiCompleted,
      ProcessingState.materializing,
      ProcessingState.completed,
    ];

    for (var stage in stages) {
      await Future.delayed(const Duration(seconds: 2));
      _updateJobState(jobId, stage);
      
      // Simulate notifications
      if (stage == ProcessingState.ocrCompleted) {
        // ref.read(notificationServiceProvider).showOCRCompleted();
      } else if (stage == ProcessingState.completed) {
        // ref.read(notificationServiceProvider).showReceiptReady('Store', 'receipt-id');
      }
    }
    
    // Auto-remove completed jobs after a while
    await Future.delayed(const Duration(seconds: 3));
    state = state.where((j) => j.id != jobId).toList();
  }

  void _updateJobState(String jobId, ProcessingState newState) {
    state = state.map((job) {
      if (job.id == jobId) {
        return job.copyWith(state: newState);
      }
      return job;
    }).toList();
  }

  void retryJob(String jobId) {
    _updateJobState(jobId, ProcessingState.retrying);
    ref.read(backgroundServiceProvider).scheduleProcessingJob(jobId);
    _simulateProgress(jobId); // Restart simulation
  }
}
