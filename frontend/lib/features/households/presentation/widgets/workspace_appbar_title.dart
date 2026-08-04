import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/household_models.dart';
import '../../application/household_controller.dart';

class WorkspaceAppBarTitle extends ConsumerWidget {
  final String fallbackTitle;

  const WorkspaceAppBarTitle({super.key, required this.fallbackTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeWorkspace = ref.watch(householdControllerProvider.select((s) => s.activeWorkspace));

    String titleText = fallbackTitle;
    
    if (activeWorkspace.type == WorkspaceType.personal) {
      titleText = '👤 Personal';
    } else if (activeWorkspace.type == WorkspaceType.household && activeWorkspace.householdName != null) {
      titleText = '🏠 ${activeWorkspace.householdName}';
    }

    return Text(
      titleText,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
