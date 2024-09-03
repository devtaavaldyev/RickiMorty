// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:try_ricki_2/core/errors/failures.dart';
import 'package:try_ricki_2/features/data/models/characters_model.dart';
import 'package:try_ricki_2/features/domain/repositories/characters_repository.dart';

class CharactersCase {
  CharactersCase(this.charactersRepo);

  final CharactersRepository charactersRepo;

  Future<Either<Failure, CharactersInfoModel>> getCharacter(
      {required int page}) async {
    final getCharacters = await charactersRepo.getCharacters(page);

    return getCharacters;
  }

  Future<Either<Failure, CharactersInfoModel>> searchCharacter({
    required String name,
    required String status,
    required String gender,
  }) async {
    final searchResult = await charactersRepo.searchCharacters(
      //TODO Обработать ошибку!ё
      gender: gender,
      name: name,
      status: status,
    );

    return searchResult;
  }

  Future<Either<Failure, CharactersModel>> detailCharacter(
      {required int id}) async {
    final detailResult = await charactersRepo.detailCharacters(id);

    return detailResult;
  }
}
