part of 'searching_bloc.dart';

@freezed
class SearchingEvent extends BaseEvent with _$SearchingEvent {
  const factory SearchingEvent.started({
    required List<int> array,
    required bool shuffle,
  }) = _Started;

  const factory SearchingEvent.startLinearSearch() = _StartLinearSearch;

  const factory SearchingEvent.startBinarySearch() = _StartBinarySearch;

  const factory SearchingEvent.speedButtonClicked() = _SpeedButtonClicked;

  const factory SearchingEvent.changeSearchingSpeed({
    required int searchingSpeed,
  }) = _ChangeSearchingSpeed;

  const factory SearchingEvent.lengthButtonClicked() = _LengthButtonClicked;

  const factory SearchingEvent.changeArrayLength({
    required int arrayLength,
  }) = _ChangeArrayLength;

  const factory SearchingEvent.randomizeButtonClicked() =
      _RandomizeButtonClicked;

  const factory SearchingEvent.changeNumberToSearch({
    required int? numberToSearch,
  }) = _ChangeNumberToSearch;
}
