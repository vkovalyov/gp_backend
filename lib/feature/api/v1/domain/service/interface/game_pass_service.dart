import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/service/interface/base_service.dart';

import '../../model/game_details/game_list.dart';


abstract class GamePassService extends BaseService<BaseEntity> {
  Future<GameList?> findAllByXboxPlatform();
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform();
}
