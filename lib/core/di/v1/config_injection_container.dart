import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/config/mongodb_config.dart';
import 'package:gp_backend/core/config/server_config.dart';

final slConfig = GetIt.instance;

Future<void> init() async {
  slConfig.registerLazySingleton<ServerConfig>(() => ServerConfig());
  slConfig.registerLazySingleton<MongodbConfig>(() => MongodbConfig());
}
