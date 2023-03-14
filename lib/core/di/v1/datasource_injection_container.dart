import 'package:get_it/get_it.dart';
import 'package:gp_backend/core/config/mongodb_config.dart';
import 'package:gp_backend/core/di/external_injection_container.dart';
import 'package:gp_backend/core/di/v1/config_injection_container.dart';
import 'package:gp_backend/feature/api/v1/data/entity_collection_name.dart';
import 'package:gp_backend/feature/api/v1/data/game_pass_datasource_impl.dart';
import 'package:gp_backend/feature/api/v1/data/interface/game_pass_datasource.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/version_entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

final slDatasource = GetIt.instance;

Future<void> init() async {
  final db = await Db.create(slConfig<MongodbConfig>().connectionString);
  slDatasource.registerLazySingleton(() => db);

  slDatasource
      .registerLazySingleton<GamePassDatasource>(() => GamePassDatasourceImpl(
            db: slDatasource(),
            collectionName: EntityCollectionName.categories.name,
            dio: slExternal(),
            fromJson: VersionEntity.fromJson,
            logger: slExternal(),
          ));
}
