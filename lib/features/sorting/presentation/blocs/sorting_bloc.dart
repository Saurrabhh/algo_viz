import 'package:algo_viz/core/base_bloc/base_bloc.dart';
import 'package:algo_viz/core/failure/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sorting_bloc.freezed.dart';
part 'sorting_event.dart';
part 'sorting_state.dart';

@injectable
class SortingBloc extends BaseBloc<SortingEvent, SortingState> {
  SortingBloc()
      : super(
          const SortingState.initial(
            store: SortingStateStore(),
          ),
        );

  @override
  void handleEvents() {
    on<_Started>(_onStarted);
  }

  void _onStarted(
    _Started event,
    Emitter<SortingState> emit,
  ) {}

  @override
  bool get isLoading => state.store.loading;

  @override
  void started({
    Map<String, dynamic>? args,
  }) {
    add(const SortingEvent.started());
  }
}
