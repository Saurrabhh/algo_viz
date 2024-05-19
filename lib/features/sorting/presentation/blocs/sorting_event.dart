part of 'sorting_bloc.dart';

@freezed
class SortingEvent extends BaseEvent with _$SortingEvent {
  const factory SortingEvent.started({
    required List<int> array,
  }) = _Started;

  const factory SortingEvent.startBubbleSort() = _StartBubbleSort;

  const factory SortingEvent.startSelectionSort() = _StartSelectionSort;

  const factory SortingEvent.speedButtonClicked() = _SpeedButtonClicked;

  const factory SortingEvent.changeSortingSpeed({
    required int sortingSpeed,
  }) = _ChangeSortingSpeed;

  const factory SortingEvent.lengthButtonClicked() = _LengthButtonClicked;

  const factory SortingEvent.changeArrayLength({
    required int arrayLength,
  }) = _ChangeArrayLength;

  const factory SortingEvent.randomizeButtonClicked() = _RandomizeButtonClicked;
}
