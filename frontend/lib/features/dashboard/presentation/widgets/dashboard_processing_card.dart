import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/background/background_models.dart';
import 'package:receiptiq_mobile/core/background/background_processing_controller.dart';

class DashboardProcessingCard extends ConsumerWidget {
  const DashboardProcessingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobs = ref.watch(backgroundProcessingControllerProvider);
    
    if (jobs.isEmpty) return const SizedBox.shrink();

    return Column(
      children: jobs.map((job) => _buildJobCard(context, ref, job)).toList(),
    );
  }

  Widget _buildJobCard(BuildContext context, WidgetRef ref, BackgroundProcessingJob job) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: Theme.of(context).colorScheme.tertiaryContainer.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(width: 12),
                Text(
                  'Processing 🟡 ${job.filePath.split('/').last}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatusTimeline(context, job.state),
            if (job.state == ProcessingState.failed || job.state == ProcessingState.paused) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      ref.read(backgroundProcessingControllerProvider.notifier).retryJob(job.id);
                    },
                    child: const Text('Retry'),
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatusTimeline(BuildContext context, ProcessingState state) {
    final stages = [
      {'state': ProcessingState.uploading, 'label': 'Uploading'},
      {'state': ProcessingState.ocr, 'label': 'OCR'},
      {'state': ProcessingState.ai, 'label': 'AI Extraction'},
      {'state': ProcessingState.materializing, 'label': 'Materializing'},
    ];

    int currentIndex = -1;
    if (state == ProcessingState.uploading || state == ProcessingState.queued || state == ProcessingState.uploaded) currentIndex = 0;
    if (state == ProcessingState.ocr || state == ProcessingState.ocrCompleted) currentIndex = 1;
    if (state == ProcessingState.ai || state == ProcessingState.aiCompleted) currentIndex = 2;
    if (state == ProcessingState.materializing) currentIndex = 3;
    if (state == ProcessingState.completed) currentIndex = 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: stages.asMap().entries.map((entry) {
        final index = entry.key;
        final stage = entry.value;
        final isActive = index == currentIndex;
        final isPast = index < currentIndex;

        if (!isActive && !isPast) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(left: 32, bottom: 4),
          child: Row(
            children: [
              if (isPast)
                const Icon(Icons.check, size: 16, color: Colors.green)
              else if (isActive)
                const Text('Running...', style: TextStyle(color: Colors.blue, fontSize: 12, fontStyle: FontStyle.italic)),
              const SizedBox(width: 8),
              Text(
                stage['label'] as String,
                style: TextStyle(
                  color: isPast ? Colors.grey : Colors.black,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  decoration: isPast ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
