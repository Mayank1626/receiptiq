import 'package:flutter/material.dart';
import '../network/api_state.dart';
import '../network/failure.dart';
import 'shimmer_loading.dart';
import 'empty_state.dart';
import '../../core/theme/app_colors.dart';

class ApiStateWidget<T> extends StatelessWidget {
  final ApiState<T> state;
  final Widget Function(T data) successBuilder;
  final Widget Function()? loadingBuilder;
  final Widget Function(Failure failure)? errorBuilder;
  final Widget Function()? emptyBuilder;
  final bool Function(T data)? isEmpty;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onRetry;

  const ApiStateWidget({
    super.key,
    required this.state,
    required this.successBuilder,
    this.loadingBuilder,
    this.errorBuilder,
    this.emptyBuilder,
    this.isEmpty,
    this.onRefresh,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final content = state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => loadingBuilder?.call() ?? const ShimmerLoading(),
      refreshing: (data) => _buildData(data),
      success: (data) => _buildData(data),
      failure: (failure) => errorBuilder?.call(failure) ?? _buildDefaultError(context, failure),
    );

    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        color: AppColors.primary,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: content,
        ),
      );
    }

    return content;
  }

  Widget _buildData(T data) {
    if (isEmpty != null && isEmpty!(data)) {
      return emptyBuilder?.call() ??
          const EmptyState(
            icon: Icons.inbox_outlined,
            title: 'No Data',
            message: 'There is nothing to show here yet.',
          );
    }
    return successBuilder(data);
  }

  Widget _buildDefaultError(BuildContext context, Failure failure) {
    final message = failure.maybeWhen(
      network: (msg) => msg,
      server: (msg) => msg,
      unauthorized: (msg) => msg,
      validation: (msg) => msg,
      orElse: () => 'An unexpected error occurred.',
    );

    return EmptyState(
      icon: Icons.error_outline,
      title: 'Oops!',
      message: message,
      buttonLabel: onRetry != null ? 'Try Again' : null,
      onButtonPressed: onRetry ?? (onRefresh != null ? () => onRefresh!() : null),
    );
  }
}
