import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/di/v1/service_injection_container.dart';
import 'package:gp_backend/feature/api/v1/presentation/controller/game_pass_controller.dart';

final slController = GetIt.instance;

Future<void> init() async {
  slController.registerLazySingleton<GamePassController>(
      () => GamePassController(slService()));
}
