import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:try_ricki_2/utils/some_files/show_snak_error.dart';


// import 'package:flutter/foundation.dart';

class DioSettings {
  DioSettings() {
    setup();
  }
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
      connectTimeout: 1900,
      receiveTimeout: 1900,
    ),
  );

  void setup() {
    final interceptors = dio.interceptors;

    interceptors.clear();

    final logInterceptor = LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    );

    final headerInterseptors = QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        log('ON REQUEST');
        return handler.next(options);
      },
      onError: (DioError error, handler) {
        log('ON ERROR');
        ShowSnackBar.showError(error.message);
        log('BOOM${error.message}');

        handler.next(error);
      },
      onResponse: (response, handler) {
        log('ON Response');
        return handler.next(response);
      },
    );

    interceptors.addAll([
      logInterceptor,
      headerInterseptors,
    ]);
  }
}
