import 'package:gp_backend/core/di/v1/router_injection_container.dart';
import 'package:gp_backend/core/router/base_router.dart';
import 'package:gp_backend/feature/api/v1/presentation/controller/game_pass_controller.dart';
import 'package:gp_backend/feature/api/v1/presentation/endpoints/game_pass_endpoint.dart';
import 'package:shelf_router/shelf_router.dart';

class GamePassRouter extends BaseRouter {
  final GamePassController backupController;

  GamePassRouter(
    this.backupController,
  );

  @override
  Router get router {
    final router = slRouter<Router>();

    router.get(
        GamePassEndpoint.gamePass.getEndpoint(), backupController.updateOne);

    return router;
  }
}
