import 'dart:async';
import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:gp_backend/core/config/server_config.dart';
import 'package:gp_backend/init_app.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

class ConfigurationBackend {
  final ServerConfig config;

  final FutureOr<Response> Function(Request) handler;

  static Future<void> init(List<String> arguments) async {
    load();
    return initApp();
  }

  ConfigurationBackend({required this.config, required this.handler});

  Future<HttpServer> serve() {
    return io.serve(handler, InternetAddress.anyIPv4, config.port);
  }
}
