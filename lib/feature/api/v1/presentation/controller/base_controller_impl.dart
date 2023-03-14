// import 'dart:convert';
//
// import 'package:itrapp_backend/core/model/success_response_view_model.dart';
// import 'package:itrapp_backend/core/utils/entity/base_entity_utils.dart';
// import 'package:itrapp_backend/core/utils/request_extension.dart';
// import 'package:itrapp_backend/core/utils/shelf_utils.dart';
// import 'package:itrapp_backend/feature/api/v1/domain/entity/base_entity.dart';
// import 'package:itrapp_backend/feature/api/v1/domain/service/interface/base_service.dart';
// import 'package:itrapp_backend/feature/api/v1/presentation/controller/base_controller.dart';
// import 'package:itrappmodels/core/base_model.dart';
// import 'package:itrappmodels/itrapp_models.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf_router/shelf_router.dart';
//
// class BaseControllerImpl<E extends BaseEntity, M extends BaseModel>
//     implements BaseController {
//   final BaseService<E> baseService;
//   final BaseEntityUtils<E, M> entityUtils;
//   final M Function(Map<String, dynamic> map) fromJson;
//
//   BaseControllerImpl(
//       {required this.baseService,
//       required this.entityUtils,
//       required this.fromJson});
//
//   @override
//   Future<Response> findAll(Request req) async {
//     final entities = await baseService.findAll(options: req.options);
//     final responseModels =
//         entities.map((element) => entityUtils.fromEntity(element)).toList();
//     return ShelfUtils.createResponseFromList(responseModels);
//   }
//
//   @override
//   Future<Response> findAllById(Request req) async {
//     final ids = req.url.queryParametersAll['ids'];
//
//     final objectIds =
//         ids!.map((e) => ObjectId.parse(e)).toList(growable: false);
//
//     final entities = await baseService.findAllById(objectIds);
//
//     return ShelfUtils.createResponseFromList(
//         entities.map((e) => entityUtils.fromEntity(e)).toList(growable: false));
//   }
//
//   @override
//   Future<Response> findOneById(Request req) async {
//     final categoryId = ObjectId.parse(req.params['id']!);
//     final categoryEntity = await baseService.findOneById(categoryId);
//
//     return ShelfUtils.createResponseFromModel(
//         entityUtils.fromEntity(categoryEntity));
//   }
//
//   @override
//   Future<Response> createOne(Request req) async {
//     final payload = await req.readAsString();
//     final categoryEntity = entityUtils.toEntity(fromJson(jsonDecode(payload)));
//     final result = await baseService.createOne(categoryEntity);
//     return ShelfUtils.createResponseFromModel(entityUtils.fromEntity(result));
//   }
//
//   @override
//   Future<Response> deleteOneById(Request req) async {
//     final id = ObjectId.parse(req.params['id']!);
//
//     final success = await baseService.deleteOneById(id);
//
//     return ShelfUtils.createResponseFromModel(
//         SuccessResponseViewModel(success: success));
//   }
//
//   @override
//   Future<Response> deleteAllById(Request req) async {
//     final ids = req.params['ids'] as List<String>;
//     final objectIds = ids.map((e) => ObjectId.parse(e)).toList(growable: false);
//
//     final deletedCount = await baseService.deleteAllById(objectIds);
//
//     return ShelfUtils.createResponseFromModel(CountModel(count: deletedCount));
//   }
//
//   @override
//   Future<Response> updateOne(Request req) async {
//     final String id = req.params['id']!;
//     final payload = await req.readAsString();
//
//     final categoryViewModel = fromJson(jsonDecode(payload));
//
//     final success = await baseService.updateOne(
//         entityUtils.toEntity(categoryViewModel.copyWith(id: id) as M));
//
//     return ShelfUtils.createResponseFromModel(
//         SuccessResponseViewModel(success: success));
//   }
//
//   @override
//   Future<Response> createAll(Request req) async {
//     final payload = (jsonDecode(await req.readAsString()) as List<dynamic>)
//         .cast<Map<String, dynamic>>();
//
//     final entities = payload
//         .map((e) => entityUtils.toEntity(fromJson(e)))
//         .toList(growable: false);
//
//     final createdEntities = await baseService.createAll(entities);
//
//     return ShelfUtils.createResponseFromList(createdEntities
//         .map((e) => entityUtils.fromEntity(e))
//         .toList(growable: false));
//   }
//
//   @override
//   Future<Response> countAll(Request req) async {
//     final count = await baseService.countAll();
//     return ShelfUtils.createResponseFromModel(CountModel(count: count));
//   }
// }
