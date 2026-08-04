import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/network/api_state.dart';
import '../../../../core/widgets/api_state_widget.dart';
import '../application/upload_controller.dart';
import '../domain/upload_models.dart';
import 'widgets/upload_button.dart';
import 'widgets/upload_progress_card.dart';

class UploadScreen extends ConsumerWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadControllerProvider);

    // Auto-navigation side effect when completed
    ref.listen<ApiState<ProcessingJob>>(uploadControllerProvider, (previous, next) {
      next.maybeWhen(
        success: (job) {
          if (job.stage == ProcessingStage.completed && job.receiptId != null) {
            // Wait a moment so user sees the "Completed" state, then navigate.
            Future.delayed(const Duration(milliseconds: 500), () {
              if (context.mounted) {
                // Navigate to the Review screen directly
                context.go('/review/${job.receiptId}'); 
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Receipt successfully processed!')),
                );
              }
            });
          }
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Receipt'),
      ),
      body: ApiStateWidget<ProcessingJob>(
        state: uploadState,
        onRetry: () => ref.read(uploadControllerProvider.notifier).cancel(), // Retry resets state
        successBuilder: (job) {
          if (job.stage == ProcessingStage.idle) {
            return _buildSelectionUI(context, ref);
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: UploadProgressCard(currentStage: job.stage),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSelectionUI(BuildContext context, WidgetRef ref) {
    final controller = ref.read(uploadControllerProvider.notifier);
    
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'How would you like to add your receipt?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: UploadButton(
                  icon: Icons.camera_alt,
                  label: 'Camera',
                  onTap: () => controller.pickCamera(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: UploadButton(
                  icon: Icons.photo_library,
                  label: 'Gallery',
                  onTap: () => controller.pickGallery(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          UploadButton(
            icon: Icons.picture_as_pdf,
            label: 'Select PDF Document',
            onTap: () => controller.pickPDF(),
          ),
          const Spacer(),
          Text(
            'Supported formats: JPEG, PNG, WEBP, PDF (Max 10MB)',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
