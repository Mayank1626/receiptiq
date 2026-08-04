import 'package:flutter/material.dart';

class AnimatedNumber extends StatelessWidget {
  final double value;
  final String Function(double) formatter;
  final TextStyle? style;

  const AnimatedNumber({
    super.key,
    required this.value,
    required this.formatter,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: const Duration(seconds: 1),
      curve: Curves.easeOutCubic,
      builder: (context, currentValue, child) {
        return Text(
          formatter(currentValue),
          style: style,
        );
      },
    );
  }
}
