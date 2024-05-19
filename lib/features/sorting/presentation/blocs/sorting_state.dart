part of 'sorting_bloc.dart';

@freezed
sealed class SortingState extends BaseState with _$SortingState {
  const SortingState._();

  const factory SortingState.initial({
    required SortingStateStore store,
  }) = Initial;

  const factory SortingState.sortingStarted({
    required SortingStateStore store,
  }) = SortingStarted;

  const factory SortingState.scannedIndex({
    required SortingStateStore store,
  }) = ScannedIndex;

  const factory SortingState.addSortedIndex({
    required SortingStateStore store,
  }) = AddSortedIndex;

  const factory SortingState.swappedIndex({
    required SortingStateStore store,
  }) = SwappedIndex;

  const factory SortingState.noNeedOfSwap({
    required SortingStateStore store,
  }) = NoNeedOfSwap;

  const factory SortingState.sortingCompleted({
    required SortingStateStore store,
  }) = SortingCompleted;

  const factory SortingState.onSpeedButtonClicked({
    required SortingStateStore store,
  }) = OnSpeedButtonClicked;

  const factory SortingState.sortingSpeedChanged({
    required SortingStateStore store,
  }) = SortingSpeedChanged;

  const factory SortingState.onLengthButtonClicked({
    required SortingStateStore store,
  }) = OnLengthButtonClicked;

  const factory SortingState.arrayLengthChanged({
    required SortingStateStore store,
  }) = ArrayLengthChanged;

  const factory SortingState.arrayRandomized({
    required SortingStateStore store,
  }) = ArrayRandomized;

  const factory SortingState.changeLoaderState({
    required SortingStateStore store,
  }) = ChangeLoaderState;

  const factory SortingState.onFailure({
    required SortingStateStore store,
    required Failure failure,
  }) = OnFailure;

  @override
  BaseState getFailureState(Failure failure) {
    return SortingState.onFailure(
      store: store.copyWith(
        loading: false,
      ),
      failure: failure,
    );
  }

  @override
  BaseState getLoaderState({required bool loading}) {
    return SortingState.changeLoaderState(
      store: store.copyWith(
        loading: loading,
      ),
    );
  }
}

@freezed
class SortingStateStore with _$SortingStateStore {
  const factory SortingStateStore({
    int? scannedIndex1,
    int? scannedIndex2,
    @Default(false) bool isArraySorted,
    @Default({}) Set<int> sortedIndexes,
    @Default([]) List<int> array,
    @Default([]) List<int> sortedArray,
    @Default(1) int minArrayLength,
    @Default(100) int maxArrayLength,
    @Default(5) int arrayLength,
    @Default(false) bool showLengthSlider,
    @Default(1) int minSortingSpeed,
    @Default(500) int maxSortingSpeed,
    @Default(1) int sortingSpeed,
    @Default(false) bool showSpeedSlider,
    @Default(false) bool isSorting,
    @Default(false) bool loading,
  }) = _SortingStateStore;
}
