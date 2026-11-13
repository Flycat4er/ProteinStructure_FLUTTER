import 'package:flutter/material.dart';
import 'package:protein_structure/common/widgets/locale_toggle_button.dart';
import 'package:protein_structure/common/widgets/theme_toggle_button.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions = const [],
  });

  final Widget body;
  final String? title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Text(title ?? AppLocalizations.of(context).appTitle),
        actionsPadding: const EdgeInsets.only(right: 16),
        actions: [
          ...actions,
          const LocaleToggleButton(),
          const SizedBox(width: 4),
          const ThemeToggleButton(),
        ],
      ),
      body: body,
    );
  }
}
