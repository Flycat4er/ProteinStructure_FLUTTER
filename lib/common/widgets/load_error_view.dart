import 'package:flutter/material.dart';
import 'package:protein_structure/common/network/load_exception.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class LoadErrorView extends StatelessWidget {
  const LoadErrorView({
    super.key,
    required this.error,
    required this.onRetry,
  });

  final LoadException error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    final message = switch (error) {
      NoConnectionException() => l10n.errorNoConnection,
      TimeoutLoadException() => l10n.errorTimeout,
      NotFoundException() => l10n.errorNotFound,
      ServerException(:final statusCode) => l10n.errorServer(
          statusCode?.toString() ?? '?',
        ),
      BadResponseException() => l10n.errorBadResponse,
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 56,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 20),
            if (error is! NotFoundException)
              FilledButton.tonal(
                onPressed: onRetry,
                child: Text(l10n.actionRetry),
              ),
          ],
        ),
      ),
    );
  }
}
