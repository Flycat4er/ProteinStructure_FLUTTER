import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/widgets/app_scaffold.dart';
import 'package:protein_structure/common/widgets/load_error_view.dart';
import 'package:protein_structure/features/protein/presentation/bloc/list/protein_list_cubit.dart';
import 'package:protein_structure/features/protein/presentation/bloc/list/protein_list_state.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/protein_card.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/search_field.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class ProteinListScreen extends StatelessWidget {
  const ProteinListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<ProteinListCubit>();

    return AppScaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: SearchField(
              initialQuery: cubit.state.query,
              onChanged: cubit.search,
            ),
          ),
          Expanded(
            child: BlocBuilder<ProteinListCubit, ProteinListState>(
              builder: (context, state) => switch (state) {
                ProteinListLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ProteinListFailure(:final error) => Center(
                    child: LoadErrorView(
                      error: error,
                      onRetry: cubit.retry,
                    ),
                  ),
                ProteinListLoaded(:final items) when items.isEmpty => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_outlined,
                            size: 64,
                            color: theme.colorScheme.outline,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            l10n.emptySearchTitle,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.emptySearchDesc,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ProteinListLoaded() => _ProteinList(state: state),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProteinList extends StatefulWidget {
  const _ProteinList({required this.state});

  final ProteinListLoaded state;

  @override
  State<_ProteinList> createState() => _ProteinListState();
}

class _ProteinListState extends State<_ProteinList> {
  late final ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.position.extentAfter < 240) {
      context.read<ProteinListCubit>().loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = widget.state;
    final showFooter = state.isLoadingMore || state.loadMoreError != null;

    return ListView.separated(
      key: const PageStorageKey<String>('protein_list_view'),
      controller: _controller,
      padding: const EdgeInsets.all(16),
      itemCount: state.items.length + (showFooter ? 1 : 0),
      separatorBuilder: (_, _) => const SizedBox(height: 12),
      itemBuilder: (context, index) => index < state.items.length
          ? ProteinCard(protein: state.items[index])
          : _Footer(state: state),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.state});

  final ProteinListLoaded state;

  @override
  Widget build(BuildContext context) {
    final error = state.loadMoreError;
    return Center(
      child: error == null
          ? const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(),
            )
          : LoadErrorView(
              error: error,
              onRetry: context.read<ProteinListCubit>().loadMore,
            ),
    );
  }
}
