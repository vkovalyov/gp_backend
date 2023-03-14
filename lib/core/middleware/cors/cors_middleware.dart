import 'package:gp_backend/core/middleware/middleware.dart';
import 'package:shelf/shelf.dart';

class CorsMiddleware extends BaseMiddleware {
  @override
  Middleware get middleware {
    return createCorsHeadersMiddleware();
  }
}

Middleware createCorsHeadersMiddleware({Map<String, String>? corsHeaders}) {
  corsHeaders ??= {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Credentials': 'true',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Methods': '*'
  };

  Response? handleOptionsRequest(Request request) {
    if (request.method == 'OPTIONS') {
      return Response.ok(null, headers: corsHeaders);
    }
    return null;
  }

  Response addCorsHeaders(Response response) =>
      response.change(headers: corsHeaders);

  return createMiddleware(
      requestHandler: handleOptionsRequest, responseHandler: addCorsHeaders);
}
