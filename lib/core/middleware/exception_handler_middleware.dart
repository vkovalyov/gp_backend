import 'dart:convert';
import 'dart:io';
import 'package:gp_backend/core/errors/base_exception.dart';
import 'package:gp_backend/core/errors/error_message.dart';
import 'package:gp_backend/core/middleware/middleware.dart';
import 'package:gp_backend/core/utils/shelf_utils.dart';
import 'package:shelf/shelf.dart';

class ExceptionHandlerMiddleware extends BaseMiddleware {
  @override
  Middleware get middleware {
    return createMiddleware(
      errorHandler: (error, stacktrace) {
        if (error is BaseException) {
          return Response(error.httpStatus,
              body: jsonEncode(error.toJson()),
              headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
        }
        final defaultError = BaseException(
            message: ErrorMessage.unknownServerError,
            messageKey: ErrorMessage.unknownServerErrorKey,
            httpStatus: HttpStatus.internalServerError);

        return ShelfUtils.createResponseFromModel(defaultError,
            httpStatus: defaultError.httpStatus);
      },
    );
  }
}
