part of 'sorting_bloc.dart';

@freezed
class SortingEvent extends BaseEvent with _$SortingEvent {
  const factory SortingEvent.started({
    required List<int> array,
  }) = _Started;

  const factory SortingEvent.startBubbleSort() = _StartBubbleSort;
}
