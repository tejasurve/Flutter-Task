/*
 * Created on Thu Oct 31 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */

import 'package:flutter_task/config/network/api_service.dart';
import 'package:flutter_task/config/network/http_factory.dart';
import 'package:flutter_task/config/network/network_config.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

class ServiceLocator {
  ServiceLocator._();

  static final ServiceLocator instance = ServiceLocator._();

  Future<void> init() async {
    serviceLocator.registerLazySingleton<HttpFactory>(() => HttpFactory());
    serviceLocator.registerLazySingleton<NetworkConfig>(() => NetworkConfig());

    final dio = serviceLocator<HttpFactory>().getClient();
    serviceLocator.registerLazySingleton<ApiService>(() => ApiService(dio));
  }
}
