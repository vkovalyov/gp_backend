import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/middleware/exception_handler_middleware.dart';
import 'package:gp_backend/core/middleware/logger/logger_middleware.dart';
import 'package:gp_backend/core/middleware/logger/logger_middleware_impl.dart';


final slMiddleware = GetIt.instance;

Future<void> init() async {
  slMiddleware
      .registerLazySingleton<LoggerMiddleware>(() => LoggerMiddlewareImpl());
  slMiddleware.registerLazySingleton<ExceptionHandlerMiddleware>(
      () => ExceptionHandlerMiddleware());

}
