import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_ricki_2/features/data/datasources/dio_settings.dart';
import 'package:try_ricki_2/features/data/datasources/characters_network_data_impl.dart';
import 'package:try_ricki_2/features/data/repositories/characters_repository_impl.dart';

import 'package:try_ricki_2/features/domain/repositories/characters_network_data.dart';
import 'package:try_ricki_2/features/domain/repositories/characters_repository.dart';
import 'package:try_ricki_2/features/domain/usecases/characters_case.dart';
import 'package:try_ricki_2/features/presentation/bloc/characters/characters_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  /// Dio / Http
  sl.registerLazySingleton<DioSettings>(
    () => DioSettings(),
  );

  /// DataSources
  sl.registerLazySingleton<CharactersNetworkData>(
    () => CharactersNetworkDataImpl(dio: sl<DioSettings>().dio),
  );

  /// Repositories
  sl.registerLazySingleton<CharactersRepository>(
    () => CharactersRepositoryImpl(sl()),
  );

  /// UseCases
  sl.registerLazySingleton(
    () => CharactersCase(sl()),
  );

  /// BloCs / Cubits
  sl.registerFactory(
    () => CharactersBloc(usecase: sl()),
  );
}
