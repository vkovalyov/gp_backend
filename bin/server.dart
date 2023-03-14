
import 'package:gp_backend/configuration.dart';
import 'package:gp_backend/core/di/v1/config_injection_container.dart';
import 'package:gp_backend/core/di/v1/handler_injection_container.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';

void main(List<String> args) async {
  await ConfigurationBackend.init(args);

  withHotreload(
          () => ConfigurationBackend(config: slConfig(), handler: slHandler()).serve());
}
