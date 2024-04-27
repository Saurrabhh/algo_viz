part of 'sorting_bloc.dart';

@freezed
sealed class SortingState extends BaseState with _$SortingState {
  const factory SortingState.initial({
    required SortingStateStore store,
  }) = Initial;

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
    @Default(false) bool loading,
  }) = _SortingStateStore;
}
