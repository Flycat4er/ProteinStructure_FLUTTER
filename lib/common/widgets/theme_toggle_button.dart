import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/theme/theme_cubit.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Tooltip(
      message: l10n.actionToggleTheme,
      child: IconButton(
        icon: Icon(
          Icons.contrast,
          color: theme.colorScheme.onSurface,
        ),
        style: IconButton.styleFrom(
          minimumSize: const Size(44, 44),
          fixedSize: const Size(44, 44),
          padding: EdgeInsets.zero,
        ),
        onPressed: context.read<ThemeCubit>().toggle,
      ),
    );
  }
}
