import 'package:algo_viz/constants/constants.dart';
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
    on<_StartBubbleSort>(_onStartBubbleSort);
  }

  void _onStarted(
    _Started event,
    Emitter<SortingState> emit,
  ) {
    emit(
      SortingState.initial(
        store: state.store.copyWith(
          array: List<int>.from(event.array),
          sortedArray: List<int>.from(event.array),
        ),
      ),
    );
  }

  Future<void> _onStartBubbleSort(
    _StartBubbleSort event,
    Emitter<SortingState> emit,
  ) async {
    await _bubbleSort(emit);
  }

  @override
  bool get isLoading => state.store.loading;

  @override
  void started({
    Map<String, dynamic>? args,
  }) {
    final array = args?[StringConstants.intArray] as List<int>?;

    add(SortingEvent.started(array: array ?? []));
  }

  void startBubbleSort() {
    add(const SortingEvent.startBubbleSort());
  }

  Future<void> _bubbleSort(Emitter<SortingState> emit) async {
    final array = List<int>.from(state.store.sortedArray);
    final lengthOfArray = array.length;

    for (int i = 0; i < lengthOfArray - 1; i++) {
      bool isSwap = false;

      for (int j = 0; j < lengthOfArray - i - 1; j++) {
        emit(
          SortingState.scannedIndex(
            store: state.store.copyWith(
              scannedIndex1: j,
              scannedIndex2: j + 1,
            ),
          ),
        );
        await _addDelay();

        if (array[j] > array[j + 1]) {
          final temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;

          isSwap = true;

          emit(
            SortingState.swappedIndex(
              store: state.store.copyWith(
                sortedArray: List<int>.from(
                  array,
                ),
                scannedIndex1: state.store.scannedIndex2,
                scannedIndex2: state.store.scannedIndex1,
              ),
            ),
          );
        } else {
          emit(
            SortingState.noNeedOfSwap(store: state.store),
          );
        }

        await _addDelay();
      }

      if(!isSwap){
        break;
      }
    }
    _sortingCompleted(emit);
  }

  Future<void> _addDelay() async {
    await Future.delayed(Duration(seconds: state.store.delayInSeconds));
  }

  void _sortingCompleted(Emitter<SortingState> emit) {
    emit(
      SortingState.sortingCompleted(
        store: state.store.copyWith(
          isArraySorted: true,
          scannedIndex1: null,
          scannedIndex2: null,
        ),
      ),
    );
  }
}
