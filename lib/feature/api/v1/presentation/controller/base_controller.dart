import 'package:shelf/shelf.dart';

abstract class BaseController {
  Future<Response> findAll(Request req);

  Future<Response> findAllById(Request req);

  Future<Response> findOneById(Request req);

  Future<Response> createOne(Request req);

  Future<Response> createAll(Request req);

  Future<Response> deleteOneById(Request req);

  Future<Response> deleteAllById(Request req);

  Future<Response> updateOne(Request req);

  Future<Response> countAll(Request req);
}
