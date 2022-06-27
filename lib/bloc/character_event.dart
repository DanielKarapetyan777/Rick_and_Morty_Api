part of 'character_bloc.dart';

@freezed
class CharacterEvent with _$CharacterEvent {
  const factory CharacterEvent.fetch({
    required int page,
    required String name,
  }) = CharacterEventFetch;
  const factory CharacterEvent.info({
    required Object id,
  }) = CharacterEventInfo;
}
