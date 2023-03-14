import 'package:gp_backend/core/di/v1/router_injection_container.dart';
import 'package:gp_backend/core/endpoints/app_endpoint.dart';
import 'package:gp_backend/core/handler/base_handler.dart';
import 'package:gp_backend/core/handler/not_found_handler.dart';
import 'package:gp_backend/core/middleware/cors/cors_middleware.dart';
import 'package:gp_backend/core/middleware/exception_handler_middleware.dart';
import 'package:gp_backend/core/middleware/logger/logger_middleware.dart';
import 'package:gp_backend/core/static/static_handler.dart';
import 'package:gp_backend/feature/api/core/router/api_core_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

const _welcomeString = 'Welcome to ITRAPP backend!!';

class AppHandler extends BaseHandler {
  final LoggerMiddleware _logger;
  final ExceptionHandlerMiddleware _exceptionHandlerMiddleware;

  AppHandler(this._logger, this._exceptionHandlerMiddleware);

  @override
  Handler get handler {
    final router = Router(notFoundHandler: defaultNotFound);

    /* /  root handler */
    router.get(AppEndpoint.base.getEndpoint(), (Request request) {
      return Response.ok(_welcomeString);
    });

    router.mount(AppEndpoint.public.getEndpoint(), staticHandler);

    /*  /api router */
    router.mount(
        AppEndpoint.api.getEndpoint(), slRouter<ApiCoreRouter>().router);

    final handler = Cascade().add(router).handler;

    return Pipeline()
        .addMiddleware(_exceptionHandlerMiddleware.middleware)
        .addMiddleware(_logger.middleware)
        .addMiddleware(CorsMiddleware().middleware)
        .addHandler(handler);
  }
}
