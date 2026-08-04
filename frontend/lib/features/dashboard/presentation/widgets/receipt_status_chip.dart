import 'package:flutter/material.dart';

class ReceiptStatusChip extends StatelessWidget {
  final String status;

  const ReceiptStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    String label = status.replaceAll('_', ' ').toUpperCase();

    switch (status.toUpperCase()) {
      case 'CONFIRMED':
        backgroundColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green[800]!;
        break;
      case 'REVIEW_REQUIRED':
        backgroundColor = Colors.orange.withOpacity(0.2);
        textColor = Colors.orange[800]!;
        label = 'REVIEW';
        break;
      case 'FAILED':
        backgroundColor = Colors.red.withOpacity(0.2);
        textColor = Colors.red[800]!;
        break;
      case 'DRAFT':
      default:
        backgroundColor = Colors.grey.withOpacity(0.2);
        textColor = Colors.grey[800]!;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
