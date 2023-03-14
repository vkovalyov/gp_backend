import 'package:gp_backend/core/config/server_config.dart';
import 'package:gp_backend/core/di/v1/config_injection_container.dart';
import 'package:shelf_static/shelf_static.dart';

final staticHandler = createStaticHandler(slConfig<ServerConfig>().publicPath);
