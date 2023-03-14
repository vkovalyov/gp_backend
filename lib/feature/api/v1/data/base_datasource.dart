import 'package:gp_backend/core/model/request_options.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class BaseDataSource<T extends BaseEntity> {
  Future<List<T>> findAll({RequestOptions? options});

  Future<List<T>> findAllById(List<ObjectId> ids);

  Future<T?> findOneById(ObjectId id);

  Future<T> createOne(T entity);

  Future<List<T>> createAll(List<T> entities);

  Future<bool> updateOne(T entity);

  Future<bool> deleteOneById(ObjectId id);

  Future<int> deleteAllById(List<ObjectId> ids);

  Future<int> countAll();

  Future<int> deleteAll();

  Future<void> clearAllCollections();

  Future<T> createOneIdOverride(entity);

  Future<List<T>> createAllIdOverride(List<T> entities);
}
