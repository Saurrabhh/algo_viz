import 'package:algo_viz/constants/string_constants/string_constants.dart';
import 'package:algo_viz/core/designs/designs.dart';
import 'package:algo_viz/di/injection.dart';
import 'package:algo_viz/features/searching/presentation/blocs/searching_bloc.dart';
import 'package:algo_viz/utils/bloc_utils/bloc_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'binary_search_form.dart';

class BinarySearchPage extends StatelessWidget {
  const BinarySearchPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchingBloc>()
        ..started(
          args: {
            StringConstants.shuffle: false,
          },
        ),
      child: const _BinarySearchForm(),
    );
  }
}
