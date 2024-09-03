import 'package:dartz/dartz.dart';
import 'package:try_ricki_2/core/errors/failures.dart';

import 'package:try_ricki_2/features/data/models/characters_model.dart';

abstract class CharactersRepository {
  Future<Either<Failure, CharactersInfoModel>> getCharacters(int page);
  Future<Either<Failure, CharactersInfoModel>> searchCharacters({
    required String name,
    required String status,
    required String gender,
  });
  Future<Either<Failure, CharactersModel>> detailCharacters(int id);
}
