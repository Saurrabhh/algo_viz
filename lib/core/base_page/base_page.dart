import 'package:algo_viz/core/base_bloc/base_bloc.dart';
import 'package:algo_viz/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BasePage<B extends BaseBloc> extends StatelessWidget {
  const BasePage({
    required this.args,
    super.key,
  });
  final Map<String, dynamic>? args;

  bool get showFullScreenLoader => true;

  Widget buildScreen(BuildContext context);

  B getImplementedBloc({
    required BuildContext context,
    Map<String, dynamic>? args,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getImplementedBloc(
        context: context,
        args: args,
      ),
      child: Stack(
        children: <Widget>[
          buildScreen(context),
          if (showFullScreenLoader) ...<Widget>[
            _Loader<B>(),
          ],
        ],
      ),
    );
  }
}

class _Loader<B extends BaseBloc<BaseEvent, BaseState>>
    extends StatelessWidget {
  const _Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: getBloc<B>(context),
      builder: (context, state) {
        if (getBloc(context).isLoading) {
          return ColoredBox(
            color: Colors.grey.withOpacity(0.4),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
