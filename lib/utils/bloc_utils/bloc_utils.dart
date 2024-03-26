import 'package:algo_viz/core/base_bloc/base_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

B getBloc<B extends BaseBloc>(
  BuildContext context,
) =>
    BlocProvider.of<B>(context);
