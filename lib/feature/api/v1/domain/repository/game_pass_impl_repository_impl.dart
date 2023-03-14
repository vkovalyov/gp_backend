import 'package:gp_backend/feature/api/v1/data/interface/game_pass_datasource.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_products_model.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/base_repository_impl.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/game_pass_repository.dart';

import '../model/game_details/game_list.dart';

class GamePassRepositoryImpl extends BaseRepositoryImpl<BaseEntity>
    implements GamePassRepository {
  final GamePassDatasource datasource;

  GamePassRepositoryImpl(this.datasource) : super(datasource);

  @override
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform() async {
    return await datasource.findAllByDesktopPlatform();
  }

  @override
  Future<GameList?> findAllByXboxPlatform() async {
    return await datasource.findAllByXboxPlatform();
  }
}
