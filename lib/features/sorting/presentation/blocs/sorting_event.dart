part of 'sorting_bloc.dart';

@freezed
class SortingEvent extends BaseEvent with _$SortingEvent {
  const factory SortingEvent.started() = _Started;
}
