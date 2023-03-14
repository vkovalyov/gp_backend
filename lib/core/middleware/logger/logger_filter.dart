import 'package:gp_backend/core/config/server_config.dart';
import 'package:logger/logger.dart';

class LoggerFilter extends LogFilter {
  final ServerConfig config;
  LoggerFilter({
    required this.config,
  });
  @override
  bool shouldLog(LogEvent event) {
    if (config.loggerLevel.index <= event.level.index) {
      return true;
    } else {
      return false;
    }
  }
}
