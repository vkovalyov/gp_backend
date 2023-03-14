import 'dart:convert';
import 'dart:io';
import 'package:gp_backend/core/utils/shelf_utils.dart';
import 'package:gp_backend/feature/api/v1/domain/service/interface/game_pass_service.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class GamePassController {
  //extends BaseControllerImpl<VersionEntity, VersionModel> {
  final GamePassService gamePassService;

  GamePassController(this.gamePassService);

  // {required this.versionService,
  // required BaseEntityUtils<VersionEntity, VersionModel> entityUtils,
  // required VersionModel Function(Map<String, dynamic> map) fromJson})
  // : super(
  //       baseService: versionService,
  //       entityUtils: entityUtils,
  //       fromJson: fromJson);

  @override
  Future<Response> updateOne(Request req) async {
    final list = await gamePassService.findAllByXboxPlatform();


    return Response(200,
        body: jsonEncode(list?.products),
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
  }
}
