part of 'searching_bloc.dart';

@freezed
sealed class SearchingState extends BaseState with _$SearchingState {
  const SearchingState._();

  const factory SearchingState.initial({
    required SearchingStateStore store,
  }) = Initial;

  const factory SearchingState.searchingStarted({
    required SearchingStateStore store,
  }) = SearchingStarted;

  const factory SearchingState.searchedIndex({
    required SearchingStateStore store,
  }) = SearchedIndex;

  const factory SearchingState.searchingCompleted({
    required SearchingStateStore store,
  }) = SearchingCompleted;

  const factory SearchingState.onSpeedButtonClicked({
    required SearchingStateStore store,
  }) = OnSpeedButtonClicked;

  const factory SearchingState.searchingSpeedChanged({
    required SearchingStateStore store,
  }) = SearchingSpeedChanged;

  const factory SearchingState.onLengthButtonClicked({
    required SearchingStateStore store,
  }) = OnLengthButtonClicked;

  const factory SearchingState.arrayLengthChanged({
    required SearchingStateStore store,
  }) = ArrayLengthChanged;

  const factory SearchingState.arrayRandomized({
    required SearchingStateStore store,
  }) = ArrayRandomized;

  const factory SearchingState.numberToSearchChanged({
    required SearchingStateStore store,
  }) = NumberToSearchChanged;

  const factory SearchingState.changeLoaderState({
    required SearchingStateStore store,
  }) = ChangeLoaderState;

  const factory SearchingState.onFailure({
    required SearchingStateStore store,
    required Failure failure,
  }) = OnFailure;

  @override
  BaseState getFailureState(Failure failure) {
    return SearchingState.onFailure(
      store: store.copyWith(
        loading: false,
      ),
      failure: failure,
    );
  }

  @override
  BaseState getLoaderState({required bool loading}) {
    return SearchingState.changeLoaderState(
      store: store.copyWith(
        loading: loading,
      ),
    );
  }
}

@freezed
class SearchingStateStore with _$SearchingStateStore {
  const factory SearchingStateStore({
    int? numberToSearch,
    int? left,
    int? right,
    @Default(0) int searchedIndex,
    @Default([]) List<int> array,
    @Default(1) int minArrayLength,
    @Default(100) int maxArrayLength,
    @Default(5) int arrayLength,
    @Default(false) bool showLengthSlider,
    @Default(1) int minSearchingSpeed,
    @Default(10) int maxSearchingSpeed,
    @Default(1) int searchingSpeed,
    @Default(false) bool showSpeedSlider,
    @Default(false) bool isSearching,
    @Default(false) bool searchingCompleted,
    @Default(true) bool shuffle,
    @Default(false) bool loading,
  }) = _SearchingStateStore;
}
