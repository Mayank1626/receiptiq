import 'package:flutter/material.dart';

class FadeSlideWrapper extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Offset startOffset;

  const FadeSlideWrapper({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
    this.startOffset = const Offset(0, 0.2), // Slide up by default
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeOutCubic,
      builder: (context, value, childWidget) {
        // value goes from 0.0 to 1.0
        return Opacity(
          opacity: value,
          child: FractionalTranslation(
            translation: Offset.lerp(startOffset, Offset.zero, value)!,
            child: childWidget,
          ),
        );
      },
      child: child,
    );
  }
}
