import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/export_models.dart';
import '../../application/export_controller.dart';

class ExportProgressDialog extends ConsumerWidget {
  const ExportProgressDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final job = ref.watch(exportJobProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: _buildContent(context, ref, job),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, ExportJob job) {
    if (job.status == ExportJobStatus.completed) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 64),
          const SizedBox(height: 16),
          const Text('Report Ready', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Your report has been successfully generated.', textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton.icon(
                onPressed: () => ref.read(exportControllerProvider).printLastReport(),
                icon: const Icon(Icons.print),
                label: const Text('Print'),
              ),
              FilledButton.icon(
                onPressed: () => ref.read(exportControllerProvider).shareLastReport(),
                icon: const Icon(Icons.share),
                label: const Text('Share'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              ref.read(exportControllerProvider).resetJob();
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    } else if (job.status == ExportJobStatus.failed) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 64),
          const SizedBox(height: 16),
          const Text('Generation Failed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(job.errorMessage ?? 'An unknown error occurred.', textAlign: TextAlign.center, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {
              ref.read(exportControllerProvider).resetJob();
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 24),
          Text(_getStatusMessage(job.status), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          LinearProgressIndicator(value: job.progress),
        ],
      );
    }
  }

  String _getStatusMessage(ExportJobStatus status) {
    switch (status) {
      case ExportJobStatus.idle:
        return 'Waiting...';
      case ExportJobStatus.preparing:
        return 'Preparing Report...';
      case ExportJobStatus.collecting:
        return 'Collecting Data...';
      case ExportJobStatus.building:
        return 'Building Layout...';
      case ExportJobStatus.generating:
        return 'Generating File...';
      case ExportJobStatus.saving:
        return 'Saving File...';
      default:
        return 'Processing...';
    }
  }
}
