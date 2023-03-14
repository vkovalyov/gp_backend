import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/di/external_injection_container.dart';
import 'package:gp_backend/core/di/v1/repository_injection_container.dart';
import 'package:gp_backend/feature/api/v1/domain/service/game_pass_service_impl.dart';
import 'package:gp_backend/feature/api/v1/domain/service/interface/game_pass_service.dart';

final slService = GetIt.instance;

Future<void> init() async {
  slService.registerLazySingleton<GamePassService>(() => GamePassServiceImpl(
        slExternal(),
        slRepository(),
      ));
}
