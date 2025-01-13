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
    on<_StartSelectionSort>(_onStartSelectionSort);
    on<_SpeedButtonClicked>(_onSpeedButtonClicked);
    on<_ChangeSortingSpeed>(_onChangeSortingSpeed);
    on<_LengthButtonClicked>(_onLengthButtonClicked);
    on<_ChangeArrayLength>(_onChangeArrayLength);
    on<_RandomizeButtonClicked>(_onRandomizeButtonClicked);
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
          isArraySorted: false,
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

  Future<void> _onStartSelectionSort(
    _StartSelectionSort event,
    Emitter<SortingState> emit,
  ) async {
    await _selectionSort(emit);
  }

  void _onSpeedButtonClicked(
    _SpeedButtonClicked event,
    Emitter<SortingState> emit,
  ) {
    emit(
      SortingState.onSpeedButtonClicked(
        store: state.store.copyWith(
          showSpeedSlider: !state.store.showSpeedSlider,
        ),
      ),
    );
  }

  void _onChangeSortingSpeed(
    _ChangeSortingSpeed event,
    Emitter<SortingState> emit,
  ) {
    int sortingSpeed = event.sortingSpeed;

    if (sortingSpeed > state.store.maxSortingSpeed) {
      sortingSpeed = state.store.maxSortingSpeed;
    } else if (sortingSpeed < state.store.minSortingSpeed) {
      sortingSpeed = state.store.minSortingSpeed;
    }

    emit(
      SortingState.sortingSpeedChanged(
        store: state.store.copyWith(
          sortingSpeed: sortingSpeed,
        ),
      ),
    );
  }

  void _onLengthButtonClicked(
    _LengthButtonClicked event,
    Emitter<SortingState> emit,
  ) {
    emit(
      SortingState.onLengthButtonClicked(
        store: state.store.copyWith(
          showLengthSlider: !state.store.showLengthSlider,
        ),
      ),
    );
  }

  void _onChangeArrayLength(
    _ChangeArrayLength event,
    Emitter<SortingState> emit,
  ) {
    int arrayLength = event.arrayLength;

    if (arrayLength > state.store.maxArrayLength) {
      arrayLength = state.store.maxArrayLength;
    } else if (arrayLength < state.store.minArrayLength) {
      arrayLength = state.store.minArrayLength;
    }

    final array = _generateRandomList(arrayLength);

    emit(
      SortingState.arrayLengthChanged(
        store: state.store.copyWith(
          arrayLength: arrayLength,
          array: array,
          sortedArray: List<int>.from(array),
          isArraySorted: false,
        ),
      ),
    );
  }

  void _onRandomizeButtonClicked(
    _RandomizeButtonClicked event,
    Emitter<SortingState> emit,
  ) {
    final array = _generateRandomList(state.store.arrayLength);

    emit(
      SortingState.arrayRandomized(
        store: state.store.copyWith(
          array: array,
          sortedArray: List<int>.from(array),
          isArraySorted: false,
        ),
      ),
    );
  }

  @override
  bool get isLoading => state.store.loading;

  @override
  void started({
    Map<String, dynamic>? args,
  }) {
    final array = args?[StringConstants.intArray] as List<int>?;

    add(
      SortingEvent.started(
        array: array ?? _generateRandomList(state.store.arrayLength),
      ),
    );
  }

  void startBubbleSort() {
    add(const SortingEvent.startBubbleSort());
  }

  void startSelectionSort() {
    add(const SortingEvent.startSelectionSort());
  }

  void speedButtonClicked() {
    add(const SortingEvent.speedButtonClicked());
  }

  void changeSortingSpeed(int sortingSpeed) {
    add(
      SortingEvent.changeSortingSpeed(
        sortingSpeed: sortingSpeed,
      ),
    );
  }

  void lengthButtonClicked() {
    add(const SortingEvent.lengthButtonClicked());
  }

  void randomizeButtonClicked() {
    add(const SortingEvent.randomizeButtonClicked());
  }

  void changeArrayLength(int arrayLength) {
    add(
      SortingEvent.changeArrayLength(
        arrayLength: arrayLength,
      ),
    );
  }

  Future<void> _bubbleSort(Emitter<SortingState> emit) async {
    final array = List<int>.from(state.store.sortedArray);
    final lengthOfArray = array.length;

    emit(
      SortingState.sortingStarted(
        store: state.store.copyWith(
          isSorting: true,
        ),
      ),
    );

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

      emit(
        SortingState.addSortedIndex(
          store: state.store.copyWith(
            sortedIndexes: {
              ...state.store.sortedIndexes,
              lengthOfArray - i - 1,
            },
          ),
        ),
      );

      if (!isSwap) {
        break;
      }
    }
    _sortingCompleted(emit);
  }

  Future<void> _selectionSort(Emitter<SortingState> emit) async {
    final array = List<int>.from(state.store.sortedArray);
    final lengthOfArray = array.length;

    emit(
      SortingState.sortingStarted(
        store: state.store.copyWith(
          isSorting: true,
        ),
      ),
    );

    for (int i = 0; i < lengthOfArray - 1; i++) {
      int minIndex = i;

      for (int j = i + 1; j < lengthOfArray; j++) {
        emit(
          SortingState.scannedIndex(
            store: state.store.copyWith(
              scannedIndex1: j,
              scannedIndex2: minIndex,
            ),
          ),
        );
        await _addDelay();

        if (array[j] < array[minIndex]) {
          minIndex = j;
        }
      }

      final temp = array[minIndex];
      array[minIndex] = array[i];
      array[i] = temp;

      emit(
        SortingState.swappedIndex(
          store: state.store.copyWith(
            sortedArray: List<int>.from(
              array,
            ),
            scannedIndex1: minIndex,
            scannedIndex2: i,
          ),
        ),
      );

      await _addDelay();

      emit(
        SortingState.addSortedIndex(
          store: state.store.copyWith(
            sortedIndexes: {
              ...state.store.sortedIndexes,
              i,
            },
          ),
        ),
      );

    }

    _sortingCompleted(emit);
  }

  Future<void> _addDelay() async {
    await Future.delayed(
      Duration(
        milliseconds: 1000 ~/ state.store.sortingSpeed,
      ),
    );
  }

  void _sortingCompleted(Emitter<SortingState> emit) {
    emit(
      SortingState.sortingCompleted(
        store: state.store.copyWith(
          isArraySorted: true,
          scannedIndex1: null,
          scannedIndex2: null,
          isSorting: false,
          sortedIndexes: {},
        ),
      ),
    );
  }

  List<int> _generateRandomList(int length) {
    return List.generate(length, (index) => index + 1)..shuffle();
  }
}
