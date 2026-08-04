import 'package:flutter/material.dart';
import '../../domain/upload_models.dart';
import 'processing_step.dart';

class UploadProgressCard extends StatelessWidget {
  final ProcessingStage currentStage;

  const UploadProgressCard({super.key, required this.currentStage});

  bool _isCompleted(ProcessingStage stage) {
    if (currentStage == ProcessingStage.completed) return true;
    return currentStage.index > stage.index && currentStage != ProcessingStage.failed;
  }

  bool _isActive(ProcessingStage stage) {
    return currentStage == stage;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Processing Receipt', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 24),
            ProcessingStep(
              title: 'Uploading File',
              isActive: _isActive(ProcessingStage.uploading),
              isCompleted: _isCompleted(ProcessingStage.uploading),
            ),
            ProcessingStep(
              title: 'Reading Text (OCR)',
              isActive: _isActive(ProcessingStage.ocr),
              isCompleted: _isCompleted(ProcessingStage.ocr),
            ),
            ProcessingStep(
              title: 'Extracting Data (AI)',
              isActive: _isActive(ProcessingStage.ai),
              isCompleted: _isCompleted(ProcessingStage.ai),
            ),
            ProcessingStep(
              title: 'Finalizing Receipt',
              isActive: _isActive(ProcessingStage.materializing),
              isCompleted: _isCompleted(ProcessingStage.materializing),
            ),
            if (currentStage == ProcessingStage.failed) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error),
                    const SizedBox(width: 12),
                    const Expanded(child: Text('Processing failed. Please try again.')),
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
