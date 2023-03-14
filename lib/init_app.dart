import 'dart:io';

import 'package:gp_backend/core/config/server_config.dart';
import 'package:gp_backend/core/di/external_injection_container.dart';
import 'package:gp_backend/core/di/v1/config_injection_container.dart';
import 'package:gp_backend/core/di/external_injection_container.dart'
    as di_external;

import 'package:gp_backend/core/di/v1/config_injection_container.dart'
    as di_config;
import 'package:gp_backend/core/di/v1/controller_injection_container.dart'
    as di_controller;
import 'package:gp_backend/core/di/v1/datasource_injection_container.dart'
    as di_datasource;
import 'package:gp_backend/core/di/v1/handler_injection_container.dart'
    as di_handler;
import 'package:gp_backend/core/di/v1/middleware_injection_container.dart'
    as di_middleware;
import 'package:gp_backend/core/di/v1/repository_injection_container.dart'
    as di_repository;
import 'package:gp_backend/core/di/v1/router_injection_container.dart'
    as di_router;
import 'package:gp_backend/core/di/v1/service_injection_container.dart'
    as di_service;
import 'package:gp_backend/core/di/v1/utils_injection_container.dart'
    as di_utils;
import 'package:logger/logger.dart';

Future<void> initApp() async {
  await di_config.init();
  await di_utils.init();

  await di_external.init();
  await di_datasource.init();
  await di_repository.init();
  await di_service.init();
  await di_controller.init();

  await di_middleware.init();
  await di_router.init();
  await di_handler.init();

  await createDirectories();
}

Future<void> createDirectories() async {
  if (!await Directory(slConfig<ServerConfig>().publicPath).exists()) {
    slExternal<Logger>().d('[GP INIT] Create public directory ...');
    await Directory(slConfig<ServerConfig>().publicPath).create();
  }
}
