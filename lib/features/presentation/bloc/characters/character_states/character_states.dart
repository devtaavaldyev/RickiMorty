part of '../characters_bloc.dart';

@freezed
class CharacterStates with _$CharacterStates {
  const factory CharacterStates.initial(
      {required List<CharactersModel> characters}) = _Initial;

  const factory CharacterStates.loading(
      {required List<CharactersModel> characters}) = _Loading;

  const factory CharacterStates.succes(List<CharactersModel> characters) =
      _Succes;

  const factory CharacterStates.error(String error) = _Error;
}
