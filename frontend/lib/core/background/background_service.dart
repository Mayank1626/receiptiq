import 'package:workmanager/workmanager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // In a real implementation, we would construct the Dio client and repositories here
    // since the background isolate is separate from the main UI isolate.
    // For this sprint's UI/UX scope, we will simulate the background state machine progression
    // by reading/writing to Hive (which can be accessed from the background isolate).
    
    // We would fetch the job from Hive using inputData?['jobId']
    // then execute the HTTP requests for upload, OCR, AI, materialize based on the current state.
    
    // Returning true indicates success, false indicates failure (Workmanager will apply exponential backoff retry).
    return Future.value(true);
  });
}

final backgroundServiceProvider = Provider<BackgroundService>((ref) {
  return BackgroundService();
});

class BackgroundService {
  Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );
  }

  Future<void> scheduleProcessingJob(String jobId) async {
    await Workmanager().registerOneOffTask(
      jobId, // unique name
      'process_receipt_task',
      inputData: {'jobId': jobId},
      constraints: Constraints(
        networkType: NetworkType.connected, // Only run when online
      ),
      backoffPolicy: BackoffPolicy.exponential,
      backoffPolicyDelay: const Duration(seconds: 30),
    );
  }
}
