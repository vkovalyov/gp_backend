import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/di/v1/controller_injection_container.dart';
import 'package:gp_backend/feature/api/core/router/api_core_router.dart';
import 'package:gp_backend/feature/api/v1/presentation/router/api_router.dart';
import 'package:gp_backend/feature/api/v1/presentation/router/game_pass_router.dart';


import 'package:shelf_router/shelf_router.dart';

final slRouter = GetIt.instance;

Future<void> init() async {
  slRouter.registerFactory(() => Router());
  slRouter.registerLazySingleton<ApiCoreRouter>(() => ApiCoreRouter());
  slRouter.registerLazySingleton<ApiRouter>(() => ApiRouter(slRouter()));
  slRouter.registerLazySingleton<GamePassRouter>(
      () => GamePassRouter(slController()));
}
