import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'app.dart';
import 'core/config/app_config.dart';
import 'core/storage/storage_service.dart';
import 'features/auth/application/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Config
  AppConfig.initialize(Environment.dev);

  // Initialize Storage
  const secureStorage = FlutterSecureStorage();
  final storageService = StorageService(secureStorage);
  await storageService.init();

  runApp(
    ProviderScope(
      overrides: [
        storageServiceProvider.overrideWithValue(storageService),
      ],
      child: const ReceiptIQApp(),
    ),
  );
}
