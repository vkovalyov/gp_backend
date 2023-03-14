import 'dart:convert';
import 'dart:io';

import 'package:gp_backend/core/errors/base_exception.dart';
import 'package:gp_backend/core/errors/error_message.dart';
import 'package:shelf/shelf.dart';

Response defaultNotFound(Request request) {
  final error = BaseException(
      messageKey: ErrorMessage.pageNotFoundKey,
      message: ErrorMessage.pageNotFound,
      httpStatus: HttpStatus.notFound);
  return Response(error.httpStatus,
      body: jsonEncode(error),
      headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
}
