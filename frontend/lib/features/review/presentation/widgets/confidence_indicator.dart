import 'package:flutter/material.dart';

class ConfidenceIndicator extends StatelessWidget {
  final double? confidence;
  final Widget child;

  const ConfidenceIndicator({
    super.key,
    required this.confidence,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (confidence == null) return child;

    final color = _getConfidenceColor(confidence!);
    
    return Tooltip(
      message: 'AI Confidence: ${(confidence! * 100).toStringAsFixed(1)}%',
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          if (confidence! < 0.8)
            Positioned(
              right: -4,
              top: -4,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: color.withValues(alpha: 0.4), blurRadius: 4, spreadRadius: 1),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getConfidenceColor(double conf) {
    if (conf >= 0.9) return Colors.green;
    if (conf >= 0.7) return Colors.orange;
    return Colors.red;
  }
}
