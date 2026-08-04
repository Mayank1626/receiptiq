import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../../../../core/network/api_state.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/background/background_processing_controller.dart';
import '../domain/upload_models.dart';
import '../data/upload_repository.dart';

final uploadRepositoryProvider = Provider<UploadRepository>((ref) {
  return UploadRepository(ref.watch(apiClientProvider));
});

final uploadControllerProvider = NotifierProvider<UploadController, ApiState<ProcessingJob>>(() {
  return UploadController();
});

class UploadController extends Notifier<ApiState<ProcessingJob>> {
  late UploadRepository _repository;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  ApiState<ProcessingJob> build() {
    _repository = ref.watch(uploadRepositoryProvider);
    return const ApiState.success(ProcessingJob(stage: ProcessingStage.idle));
  }

  Future<void> pickCamera() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await _processFile(File(image.path));
    }
  }

  Future<void> pickGallery() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await _processFile(File(image.path));
    }
  }

  Future<void> pickPDF() async {
    // Disabled temporarily
    throw UnimplementedError('pickPDF');
  }

  void cancel() {
    state = const ApiState.success(ProcessingJob(stage: ProcessingStage.idle));
  }

  Future<void> _processFile(File file) async {
    // 1. Check size (10 MB)
    final size = await file.length();
    if (size > 10 * 1024 * 1024) {
      state = ApiState.failure(Failure.validation('File size exceeds maximum limit of 10MB.'));
      return;
    }

    // 2. Copy to persistent storage
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = p.basename(file.path);
    final savedImage = await file.copy('${appDir.path}/$fileName');

    // 3. Enqueue background processing
    await ref.read(backgroundProcessingControllerProvider.notifier).enqueueJob(savedImage.path, fileName);
    
    // 4. Return to idle instantly so the user can continue using the app
    state = const ApiState.success(ProcessingJob(stage: ProcessingStage.idle));
  }
}
