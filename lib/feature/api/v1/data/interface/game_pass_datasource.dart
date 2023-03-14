import 'package:gp_backend/feature/api/v1/data/interface/mongo_datasource.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/game_list.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class GamePassDatasource extends MongoDataSource<BaseEntity> {
  GamePassDatasource(Db db) : super(db);

  Future<GameList?> findAllByXboxPlatform();
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform();
  Future<List<XboxGameEntity>?> findAllByIds(List<String> ids);

}
