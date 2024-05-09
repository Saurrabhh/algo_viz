import 'package:algo_viz/constants/string_constants/string_constants.dart';
import 'package:algo_viz/core/designs/color/app_colors.dart';
import 'package:algo_viz/di/injection.dart';
import 'package:algo_viz/features/sorting/presentation/blocs/sorting_bloc.dart';
import 'package:algo_viz/utils/bloc_utils/bloc_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bubble_sort_form.dart';

class BubbleSortPage extends StatelessWidget {
  const BubbleSortPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SortingBloc>()
        ..started(
          args: {
            StringConstants.intArray: [5, 4, 3, 2, 1],
          },
        ),
      child: const _BubbleSortForm(),
    );
  }
}
