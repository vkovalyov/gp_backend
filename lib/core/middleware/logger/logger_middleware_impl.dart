import 'dart:async';
import 'dart:io';

import 'package:gp_backend/core/di/external_injection_container.dart';
import 'package:gp_backend/core/errors/base_exception.dart';
import 'package:gp_backend/core/middleware/logger/logger_middleware.dart';
import 'package:logger/logger.dart';
import 'package:stack_trace/stack_trace.dart';

import 'package:shelf/shelf.dart';

class LoggerMiddlewareImpl extends LoggerMiddleware {
  @override
  Middleware get middleware {
    return _logRequests();
  }

  Middleware _logRequests(
          {void Function(String message, bool isError)? logger}) =>
      (innerHandler) {
        final appLogger = logger ?? _defaultLogger;

        return (request) {
          var startTime = DateTime.now();
          var watch = Stopwatch()..start();

          return Future.sync(() => innerHandler(request)).then(
              (response) async {
            var msg = _message(
                startTime, response.statusCode, request, watch.elapsed);

            appLogger(msg, false);

            return response;
          }, onError: (Object error, StackTrace stackTrace) {
            if (error is HijackException) throw error;

            watch.stop();
            String msg;
            if (error is BaseException) {
              msg =
                  _errorMessage(startTime, request, watch.elapsed, error, null);
            } else {
              msg = _errorMessage(
                  startTime, request, watch.elapsed, error, stackTrace);
            }

            appLogger(msg, true);

            throw error;
          });
        };
      };

  String _formatQuery(String query) {
    return query == '' ? '' : '?$query';
  }

  String _message(DateTime requestTime, int statusCode, Request request,
      Duration elapsedTime) {
    final clientIpAddress =
        request.context['shelf.io.connection_info'] as HttpConnectionInfo;
    return '${requestTime.toIso8601String()}\t'
        '${elapsedTime.toString().padLeft(15)}\t'
        '${clientIpAddress.remoteAddress.address}\t'
        '${request.method.padRight(7)} [$statusCode]\t'
        '${request.requestedUri.path}${_formatQuery(request.requestedUri.query)}';
  }

  String _errorMessage(DateTime requestTime, Request request,
      Duration elapsedTime, Object error, StackTrace? stack) {
    var chain = Chain.current();
    if (stack != null) {
      chain = Chain.forTrace(stack)
          .foldFrames((frame) => frame.isCore || frame.package == 'shelf')
          .terse;
    }
    final clientIpAddress =
        request.context['shelf.io.connection_info'] as HttpConnectionInfo;
    var msg =
        '${requestTime.toIso8601String()}\t${elapsedTime.toString().padLeft(15)}\t${clientIpAddress.remoteAddress.address}\t${request.method}\t${request.requestedUri.path}'
        '${_formatQuery(request.requestedUri.query)}\n$error';
    if (stack != null) {
      return '$msg\n$chain';
    } else {
      return msg;
    }
  }

  void _defaultLogger(String msg, bool isError) {
    if (isError) {
      slExternal<Logger>().e(msg);
    } else {
      slExternal<Logger>().i(msg);
    }
  }
}
