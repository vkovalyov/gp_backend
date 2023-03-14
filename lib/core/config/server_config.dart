import 'package:dotenv/dotenv.dart';
import 'package:logger/logger.dart';

const _defaultHost = 'localhost';
const _defaultPort = 8080;
const _defaultLogLevel = 'verbose';
const _pgHostkey = 'GP_HOST';
const _pgPortkey = 'GP_PORT';
const _pgLogLevelKey = 'GP_LOG_LEVEL';
const _defaultPublicDir = 'public';

class ServerConfig {
  late final String host;
  late final int port;
  late final Level loggerLevel;
  late final String avatarPath;
  late final String publicPath;

  ServerConfig() {
    host = env[_pgHostkey] ?? _defaultHost;
    port = int.tryParse(env[_pgPortkey] ?? '') ?? _defaultPort;
    loggerLevel = _getLoggerLevel();
    publicPath = env[_defaultPublicDir] ?? _defaultPublicDir;
  }

  Level _getLoggerLevel() {
    try {
      final strLvl = env[_pgLogLevelKey] ?? _defaultLogLevel;
      return Level.values.where((element) => element.name == strLvl).single;
    } catch (e) {
      return Level.verbose;
    }
  }
}
