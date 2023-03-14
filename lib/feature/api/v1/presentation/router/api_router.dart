import 'package:gp_backend/core/di/v1/router_injection_container.dart';
import 'package:gp_backend/core/endpoints/app_endpoint.dart';
import 'package:gp_backend/core/router/base_router.dart';
import 'package:gp_backend/feature/api/v1/presentation/router/game_pass_router.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiRouter extends BaseRouter {
  final GamePassRouter _gamePassRouter;

  ApiRouter(this._gamePassRouter);

  @override
  Router get router {
    final router = slRouter<Router>();

    router.mount(AppEndpoint.base.getEndpoint(), _gamePassRouter.router);

    return router;
  }
}
