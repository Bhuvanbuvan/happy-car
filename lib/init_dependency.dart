import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initDependency() {
    _initAuth();

  serviceLocator.registerLazySingleton<Dio>(
    () => Dio(),
  );
}

void _initAuth() {
  
}
