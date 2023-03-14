import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/base_repository.dart';

import '../../model/game_details/game_list.dart';


abstract class GamePassRepository implements BaseRepository<BaseEntity> {

  Future<GameList?> findAllByXboxPlatform();
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform();
}
