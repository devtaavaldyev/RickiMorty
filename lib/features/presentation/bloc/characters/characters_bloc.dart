import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:try_ricki_2/core/errors/failures.dart';
import 'package:try_ricki_2/core/errors/server_exeption.dart';
import 'package:try_ricki_2/features/data/models/characters_model.dart';
import 'package:try_ricki_2/features/domain/usecases/characters_case.dart';
part 'characters_bloc.freezed.dart';
part 'character_events/character_events.dart';
part 'character_states/character_states.dart';

class CharactersBloc extends Bloc<CharacterEvents, CharacterStates> {
  CharactersBloc({required this.usecase})
      : super(const CharacterStates.loading(characters: [])) {
    List<CharactersModel> listModel = [];
    int currentPage = 1;
    int maxPage = 2;

    on<_GetCharacters>((event, emit) async {
      emit(const CharacterStates.loading(characters: []));
      if (currentPage < maxPage) {
        final getAllCharacters = await usecase.getCharacter(page: currentPage);

        listModel.addAll(getAllCharacters.fold((l) => [], (r) => r.results!));

        getAllCharacters.fold(
            (failure) =>
                emit(CharacterStates.error(failure.message ?? ' Нечего нет!')),
            (allCharacters) => emit(CharacterStates.succes(listModel)));

        maxPage = getAllCharacters.fold(
            (failure) => 1, (allCharacters) => allCharacters.info?.pages ?? 1);
        currentPage++;
      }
    });

    on<_SearchCharacters>(
      (event, emit) async {
        emit(const CharacterStates.loading(characters: []));

        final searchedCharacter = await usecase.searchCharacter(
          name: event.name,
          gender: event.gender,
          status: event.status,
        );
        searchedCharacter.fold(
            (failure) =>
                emit(CharacterStates.error(failure.message ?? ' Нечего нет!')),
            (searchCharacter) =>
                emit(CharacterStates.succes(searchCharacter.results ?? [])));
      },
    );

    on<_$_DetailCharacters>(
      (event, emit) async {
        emit(const CharacterStates.loading(characters: []));

        final detailCharacter = await usecase.detailCharacter(id: event.id);

        detailCharacter.fold(
            (failure) =>
                emit(CharacterStates.error(failure.message ?? ' Нечего нет!')),
            (detailCharacter) =>

                /// Измени
                emit(CharacterStates.succes([detailCharacter])));
      },
    );
  }
  final CharactersCase usecase;

  /// TODO Меня используй где Error state
  String typeFailures(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Сервер не отвечает I am on BloC';
      case CasheFailure:
        return ' Не узнаемый Ошибка ';
      case ServerExeption:
        return 'Проверьте подключение к интернет I am in Bloc';
      case CasheExeption:
        return 'Нет такой Персонаж I am in Bloc';
      default:
        return 'Не узнаемый Ошибка смс от Bloc';
    }
  }
}
