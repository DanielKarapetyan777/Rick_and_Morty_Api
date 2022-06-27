import 'package:flutter_application_5/data/models/character.dart';
import 'package:flutter_application_5/data/repositorias/character_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_bloc.freezed.dart';
//part 'character_bloc.g.dart';
part 'character_state.dart';
part 'character_event.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  final CharacterInfo characterInfo;
  CharacterBloc({required this.characterRepo, required this.characterInfo})
      : super(CharacterState.loading()) {
    on<CharacterEventFetch>((event, emit) async {
      emit(CharacterState.loading());
      try {
        Character _characterLoaded =
            await characterRepo.getCharacter(event.page, event.name);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      } catch (_) {
        emit(CharacterState.error());
      }
    });
    on<CharacterEventInfo>((event, emit) async {
      emit(CharacterState.loading());
      try {
        Character _characterLoaded = await characterInfo.getCharacter(1);
        emit(CharacterState.loaded(characterLoaded: _characterLoaded));
      } catch (_) {
        emit(CharacterState.error());
      }
    });
  }
}
