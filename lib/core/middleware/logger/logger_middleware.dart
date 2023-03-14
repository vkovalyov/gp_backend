import 'package:gp_backend/core/middleware/middleware.dart';
import 'package:shelf/shelf.dart';

abstract class LoggerMiddleware extends BaseMiddleware {
  @override
  Middleware get middleware;
}
