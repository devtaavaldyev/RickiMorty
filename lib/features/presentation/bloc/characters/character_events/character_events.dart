part of '../characters_bloc.dart';

@freezed
class CharacterEvents with _$CharacterEvents {
  const factory CharacterEvents.getCharacters() = _GetCharacters;
  const factory CharacterEvents.detailCharacters(int id) = _DetailCharacters;
  const factory CharacterEvents.searchCharacters(
    String name,
    String status,
    String gender,
  ) = _SearchCharacters;
}
