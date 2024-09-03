// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:dartz/dartz.dart';
// import 'package:try_ricki_2/core/app_error.dart';
import 'package:try_ricki_2/features/data/models/characters_model.dart';

abstract class CharactersNetworkData {
  Future<CharactersInfoModel> getCharacter({
    required int page,
  });
  Future<CharactersInfoModel> searchCharacter({
    required String status,
    required String gender,
    required String name,
  });
  Future<CharactersModel> detailCharacter({
    required int id,
  });
}
