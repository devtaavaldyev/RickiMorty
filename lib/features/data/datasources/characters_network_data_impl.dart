// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:dartz/dartz.dart';
// import 'dart:developer';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:try_ricki_2/core/errors/failures.dart';
import 'package:try_ricki_2/core/errors/server_exeption.dart';

import 'package:try_ricki_2/features/data/models/characters_model.dart';

import 'package:try_ricki_2/features/domain/repositories/characters_network_data.dart';

class CharactersNetworkDataImpl implements CharactersNetworkData {
  CharactersNetworkDataImpl({
    required this.dio,
  });
  final Dio dio;
  late Response<dynamic> results;

  @override
  Future<CharactersInfoModel> getCharacter({
    required int page,
  }) async {
    try {
      results = await dio.get(
        '/character',
        queryParameters: {
          'name': '',
          'page': page,
        },
      );
      if (results.statusCode == 200) {
        return CharactersInfoModel.fromJson(results.data);
      }
    } on SocketException {
      throw const Failure(message: 'Пожалуста Проверьте Интернет Подключение');
    } on DioError catch (typeError) {
      if (typeError.type == DioErrorType.other) {
        throw const Failure(message: 'НеИзвейстный Ошибка Братан');
      } else if (typeError.response?.statusCode == 404) {
        throw const Failure(
            message: 'Братан По Данному Фильтру нечего не найдено');
      }
    }
    return throw const Failure();
  }

  @override
  Future<CharactersInfoModel> searchCharacter({
    required String name,
    required String status,
    required String gender,
  }) async {
    try {
      results = await dio.get(
        '/character',
        queryParameters: {
          'name': name,
          'status': status,
          'gender': gender,
        },
      );
      if (results.statusCode == 200) {
        return CharactersInfoModel.fromJson(results.data);
      }
    } catch (e) {
      log(e.toString());
    }
    return CharactersInfoModel();
  }

  @override
  Future<CharactersModel> detailCharacter({
    required int id,
  }) async {
    try {
      results = await dio.get(
        '/character/$id',
      );
      if (results.statusCode == 200) {
        return CharactersModel.fromJson(results.data);
      }
    } on DioError catch (typeError) {
      if (typeError.type == DioErrorType.other) {
        throw ServerExeption();
      } else if (typeError.response?.statusCode == 404) {
        throw CasheExeption();
        // ignore: unrelated_type_equality_checks
      } else if (typeError.type == SocketException) {
        throw const ServerFailure(message: 'Сервер не отвечает');
      } else {
        throw const CasheFailure(message: 'Не узнаемый Ошибка other Error');
      }
    }
    return CharactersModel.fromJson(results.data);
  }
}

// @override
// Future<BaseCharactersRepoResponse> searchCharacter(
//     {required String name}) async {
//   try {
//     results = await dio.get(
//       '/character',
//       queryParameters: {
//         'name': name,
//       },
//     );

//     return BaseCharactersRepoResponse(
//     characters: CharactersInfoModel.fromJson(results.data),
//   );
// } on DioError catch (errors) {
//   if (errors.type == DioErrorType.other) {
//     log(errors.type.toString());
//     return BaseCharactersRepoResponse(
//         error: AppError(text: errors.message));
//   }
//   return BaseCharactersRepoResponse();
// }
// }
