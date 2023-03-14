import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/config/server_config.dart';
import 'package:gp_backend/core/di/v1/config_injection_container.dart';
import 'package:gp_backend/core/dio/api.dart';
import 'package:gp_backend/core/middleware/logger/logger_filter.dart';
import 'package:logger/logger.dart';

final slExternal = GetIt.instance;

Future<void> init() async {
  slExternal.registerLazySingleton<Logger>(() => Logger(
      printer: PrettyPrinter(methodCount: 0, noBoxingByDefault: true),
      filter: LoggerFilter(config: slConfig<ServerConfig>()),
      level: slConfig<ServerConfig>().loggerLevel));

  slExternal.registerSingleton(BaseDio().get());

  //slExternal.registerSingleton(Executor());
  //await slExternal<Executor>().warmUp();
}
