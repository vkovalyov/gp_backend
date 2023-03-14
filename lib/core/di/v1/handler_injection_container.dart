import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/di/v1/middleware_injection_container.dart';
import 'package:gp_backend/core/handler/app_handler.dart';

final slHandler = GetIt.instance;

Future<void> init() async {
  slHandler.registerFactory(
      () => AppHandler(slMiddleware(), slMiddleware()).handler);
}
