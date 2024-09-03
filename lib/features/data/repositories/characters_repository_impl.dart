// ignore_for_file: public_member_api_docs, sort_constructors_first, unrelated_type_equality_checks
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:try_ricki_2/core/errors/failures.dart';
import 'package:try_ricki_2/core/errors/server_exeption.dart';

import 'package:try_ricki_2/features/data/models/characters_model.dart';
import 'package:try_ricki_2/features/domain/repositories/characters_network_data.dart';
import 'package:try_ricki_2/features/domain/repositories/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersNetworkData networkData;

  CharactersRepositoryImpl(this.networkData);

  @override
  Future<Either<Failure, CharactersInfoModel>> getCharacters(int page) async {
    try {
      final characters = await networkData.getCharacter(page: page);
      return Right(characters);
    } on DioError catch (typeError) {
      if (typeError.type == DioErrorType.other) {
        throw ServerExeption();
      } else if (typeError.response?.statusCode == 404) {
        throw CasheExeption();
      } else if (typeError.type == SocketException) {
        throw const ServerFailure(message: 'Сервер не отвечает');
      } else {
        throw const CasheFailure(message: 'Не узнаемый Ошибка other Error');
      }
    }
  }

  @override
  Future<Either<Failure, CharactersInfoModel>> searchCharacters(
      {required String status,
      required String gender,
      required String name}) async {
    try {
      final characters = await networkData.searchCharacter(
          name: name, gender: gender, status: status);
      return Right(characters);
    } on ServerExeption {
      return const Left(ServerFailure(
          message: 'Ошибка с сетью Search I am CharacterRepoImpl'));
    } on SocketException {
      return const Left(
          ServerFailure(message: 'Ошибка I am CharacterRepoImpl'));
    }
  }

  @override
  Future<Either<Failure, CharactersModel>> detailCharacters(int id) async {
    try {
      final characters = await networkData.detailCharacter(id: id);
      return Right(characters);
    } on ServerExeption {
      return const Left(ServerFailure(
          message: 'Ошибка с сетью Search I am CharacterRepoImpl'));
    }
  }
}
