import 'package:algo_viz/core/designs/designs.dart';
import 'package:algo_viz/di/injection.dart';
import 'package:algo_viz/features/sorting/presentation/blocs/sorting_bloc.dart';
import 'package:algo_viz/utils/bloc_utils/bloc_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selection_sort_form.dart';

class SelectionSortPage extends StatelessWidget {
  const SelectionSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SortingBloc>()..started(),
      child: const _SelectionSortForm(),
    );
  }
}
