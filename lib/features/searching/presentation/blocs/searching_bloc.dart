import 'package:algo_viz/constants/constants.dart';
import 'package:algo_viz/core/base_bloc/base_bloc.dart';
import 'package:algo_viz/core/failure/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'searching_bloc.freezed.dart';

part 'searching_event.dart';

part 'searching_state.dart';

@injectable
class SearchingBloc extends BaseBloc<SearchingEvent, SearchingState> {
  SearchingBloc()
      : super(
          const SearchingState.initial(
            store: SearchingStateStore(),
          ),
        );

  @override
  void handleEvents() {
    on<_Started>(_onStarted);
    on<_StartLinearSearch>(_onStartLinearSearch);
    on<_StartBinarySearch>(_onStartBinarySearch);
    on<_SpeedButtonClicked>(_onSpeedButtonClicked);
    on<_ChangeSearchingSpeed>(_onChangeSearchingSpeed);
    on<_LengthButtonClicked>(_onLengthButtonClicked);
    on<_ChangeArrayLength>(_onChangeArrayLength);
    on<_RandomizeButtonClicked>(_onRandomizeButtonClicked);
    on<_ChangeNumberToSearch>(_onChangeNumberToSearch);
  }

  void _onStarted(
    _Started event,
    Emitter<SearchingState> emit,
  ) {
    emit(
      SearchingState.initial(
        store: state.store.copyWith(
          array: List<int>.from(event.array),
          shuffle: event.shuffle,
        ),
      ),
    );
  }

  Future<void> _onStartLinearSearch(
    _StartLinearSearch event,
    Emitter<SearchingState> emit,
  ) async {
    await _linearSearch(emit);
  }

  Future<void> _onStartBinarySearch(
    _StartBinarySearch event,
    Emitter<SearchingState> emit,
  ) async {
    await _binarySearch(emit);
  }

  void _onSpeedButtonClicked(
    _SpeedButtonClicked event,
    Emitter<SearchingState> emit,
  ) {
    emit(
      SearchingState.onSpeedButtonClicked(
        store: state.store.copyWith(
          showSpeedSlider: !state.store.showSpeedSlider,
        ),
      ),
    );
  }

  void _onChangeSearchingSpeed(
    _ChangeSearchingSpeed event,
    Emitter<SearchingState> emit,
  ) {
    int searchingSpeed = event.searchingSpeed;

    if (searchingSpeed > state.store.maxSearchingSpeed) {
      searchingSpeed = state.store.maxSearchingSpeed;
    } else if (searchingSpeed < state.store.minSearchingSpeed) {
      searchingSpeed = state.store.minSearchingSpeed;
    }

    emit(
      SearchingState.searchingSpeedChanged(
        store: state.store.copyWith(
          searchingSpeed: searchingSpeed,
        ),
      ),
    );
  }

  void _onLengthButtonClicked(
    _LengthButtonClicked event,
    Emitter<SearchingState> emit,
  ) {
    emit(
      SearchingState.onLengthButtonClicked(
        store: state.store.copyWith(
          showLengthSlider: !state.store.showLengthSlider,
        ),
      ),
    );
  }

  void _onChangeArrayLength(
    _ChangeArrayLength event,
    Emitter<SearchingState> emit,
  ) {
    int arrayLength = event.arrayLength;

    if (arrayLength > state.store.maxArrayLength) {
      arrayLength = state.store.maxArrayLength;
    } else if (arrayLength < state.store.minArrayLength) {
      arrayLength = state.store.minArrayLength;
    }

    final array = _generateList(
      length: arrayLength,
      shuffle: state.store.shuffle,
    );

    emit(
      SearchingState.arrayLengthChanged(
        store: state.store.copyWith(
          arrayLength: arrayLength,
          array: array,
          searchedIndex: 0,
          searchingCompleted: false,
          left: null,
          right: null,
          isSearching: false,
        ),
      ),
    );
  }

  void _onRandomizeButtonClicked(
    _RandomizeButtonClicked event,
    Emitter<SearchingState> emit,
  ) {
    final array = _generateList(
      length: state.store.arrayLength,
      shuffle: state.store.shuffle,
    );

    emit(
      SearchingState.arrayRandomized(
        store: state.store.copyWith(
          array: array,
          searchedIndex: 0,
          searchingCompleted: false,
          isSearching: false,
        ),
      ),
    );
  }

  void _onChangeNumberToSearch(
    _ChangeNumberToSearch event,
    Emitter<SearchingState> emit,
  ) {
    emit(
      SearchingState.numberToSearchChanged(
        store: state.store.copyWith(
          numberToSearch: event.numberToSearch,
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
    final shuffle = args?[StringConstants.shuffle] as bool? ?? true;

    add(
      SearchingEvent.started(
        array: array ??
            _generateList(
              length: state.store.arrayLength,
              shuffle: shuffle,
            ),
        shuffle: shuffle,
      ),
    );
  }

  void startLinearSearch() {
    add(const SearchingEvent.startLinearSearch());
  }

  void startBinarySearch() {
    add(const SearchingEvent.startBinarySearch());
  }

  void speedButtonClicked() {
    add(const SearchingEvent.speedButtonClicked());
  }

  void changeSearchingSpeed(int searchingSpeed) {
    add(
      SearchingEvent.changeSearchingSpeed(
        searchingSpeed: searchingSpeed,
      ),
    );
  }

  void lengthButtonClicked() {
    add(const SearchingEvent.lengthButtonClicked());
  }

  void randomizeButtonClicked() {
    add(const SearchingEvent.randomizeButtonClicked());
  }

  void changeNumberToSearch(int? numberToSearch) {
    add(
      SearchingEvent.changeNumberToSearch(
        numberToSearch: numberToSearch,
      ),
    );
  }

  void changeArrayLength(int arrayLength) {
    add(
      SearchingEvent.changeArrayLength(
        arrayLength: arrayLength,
      ),
    );
  }

  Future<void> _linearSearch(Emitter<SearchingState> emit) async {
    final array = state.store.array;

    final numberToSearch = state.store.numberToSearch;

    emit(
      SearchingState.searchingStarted(
        store: state.store.copyWith(
          isSearching: true,
          searchingCompleted: false,
        ),
      ),
    );

    for (int i = 0; i < array.length; i++) {
      emit(
        SearchingState.searchedIndex(
          store: state.store.copyWith(
            searchedIndex: i,
          ),
        ),
      );
      await _addDelay();
      if (array[i] == numberToSearch) {
        return _searchingCompleted(emit);
      }
    }

    _searchingCompleted(emit);
  }

  Future<void> _binarySearch(Emitter<SearchingState> emit) async {
    final array = state.store.array;

    final numberToSearch = state.store.numberToSearch;

    if (numberToSearch == null) {
      return _searchingCompleted(emit);
    }
    emit(
      SearchingState.searchingStarted(
        store: state.store.copyWith(
          isSearching: true,
          searchingCompleted: false,
        ),
      ),
    );

    int left = 0;
    int right = array.length - 1;

    while (left <= right) {
      final middle = left + (right - left) ~/ 2;

      emit(
        SearchingState.searchedIndex(
          store: state.store.copyWith(
            searchedIndex: middle,
            left: left,
            right: right,
          ),
        ),
      );

      await _addDelay();

      if (array[middle] == numberToSearch) {
        return _searchingCompleted(emit);
      } else if (array[middle] < numberToSearch) {
        left = middle + 1;
      } else {
        right = middle - 1;
      }
    }

    _searchingCompleted(emit);
  }

  Future<void> _addDelay() async {
    await Future.delayed(
      Duration(
        milliseconds: 1000 ~/ state.store.searchingSpeed,
      ),
    );
  }

  void _searchingCompleted(Emitter<SearchingState> emit) {
    emit(
      SearchingState.searchingCompleted(
        store: state.store.copyWith(
          isSearching: false,
          searchingCompleted: true,
          left: null,
          right: null,
        ),
      ),
    );
  }

  List<int> _generateList({
    required int length,
    required bool shuffle,
  }) {
    if (shuffle) {
      return List.generate(length, (index) => index + 1)..shuffle();
    }

    return List.generate(length, (index) => index + 1);
  }
}
