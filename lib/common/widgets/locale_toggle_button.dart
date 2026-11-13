import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/theme/locale_cubit.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class LocaleToggleButton extends StatelessWidget {
  const LocaleToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.watch<LocaleCubit>().state;
    final nextLangLabel = currentLocale.languageCode == 'ru' ? 'EN' : 'RU';
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Tooltip(
      message: l10n.actionToggleLocale,
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(44, 44),
          fixedSize: const Size(44, 44),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          foregroundColor: theme.colorScheme.onSurface,
        ),
        onPressed: context.read<LocaleCubit>().toggle,
        child: Text(
          nextLangLabel,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
