import 'package:gp_backend/core/di/v1/router_injection_container.dart';
import 'package:gp_backend/core/router/base_router.dart';
import 'package:gp_backend/feature/api/core/api_version/api_version.dart';
import 'package:gp_backend/feature/api/v1/presentation/router/api_router.dart';
import 'package:shelf_router/shelf_router.dart';

class ApiCoreRouter extends BaseRouter {
  @override
  Router get router {
    final router = slRouter<Router>();

    router.mount(ApiVersion.v1.getEndpoint(), slRouter<ApiRouter>().router);

    return router;
  }
}
