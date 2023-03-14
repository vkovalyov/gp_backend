import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/di/v1/datasource_injection_container.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/game_pass_impl_repository_impl.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/game_pass_repository.dart';

final slRepository = GetIt.instance;

Future<void> init() async {
  slRepository.registerLazySingleton<GamePassRepository>(
      () => GamePassRepositoryImpl(slDatasource()));

}
