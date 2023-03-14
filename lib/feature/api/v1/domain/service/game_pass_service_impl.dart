import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_products_model.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/game_pass_repository.dart';
import 'package:gp_backend/feature/api/v1/domain/service/base_service_impl.dart';
import 'package:gp_backend/feature/api/v1/domain/service/interface/game_pass_service.dart';
import 'package:logger/logger.dart';

import '../model/game_details/game_list.dart';

class GamePassServiceImpl extends BaseServiceImpl<BaseEntity>
    implements GamePassService {
  final Logger _logger;
  final GamePassRepository _gamePassRepository;

  GamePassServiceImpl(
    this._logger,
    this._gamePassRepository,
  ) : super(
          _gamePassRepository,
          _logger,
        );

  @override
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform() async {
    _logger.d(
        'GamePassServiceImpl method findAllByDesktopPlatform');
    return await _gamePassRepository.findAllByDesktopPlatform();
  }

  @override
  Future<GameList?> findAllByXboxPlatform() async {
    _logger.d(
        'GamePassServiceImpl method findAllByXboxPlatform');
    return await _gamePassRepository.findAllByXboxPlatform();
  }
}
