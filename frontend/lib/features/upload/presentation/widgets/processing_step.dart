import 'package:flutter/material.dart';

class ProcessingStep extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isCompleted;

  const ProcessingStep({
    super.key,
    required this.title,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : (isActive ? Icons.hourglass_bottom : Icons.circle_outlined),
            color: isCompleted ? Colors.green : (isActive ? Theme.of(context).colorScheme.primary : Colors.grey),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(
              fontWeight: isActive || isCompleted ? FontWeight.bold : FontWeight.normal,
              color: isActive || isCompleted ? Theme.of(context).textTheme.bodyLarge?.color : Colors.grey,
            ),
          ),
          if (isActive) ...[
            const Spacer(),
            const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ]
        ],
      ),
    );
  }
}
