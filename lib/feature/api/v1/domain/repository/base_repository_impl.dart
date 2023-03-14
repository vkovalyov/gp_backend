import 'package:gp_backend/core/model/request_options.dart';
import 'package:gp_backend/feature/api/v1/data/base_datasource.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/base_repository.dart';

import 'package:mongo_dart/mongo_dart.dart';

class BaseRepositoryImpl<T extends BaseEntity> extends BaseRepository<T> {
  final BaseDataSource<T> _datasource;

  BaseRepositoryImpl(this._datasource);

  @override
  Future<List<T>> findAll({RequestOptions? options}) {
    return _datasource.findAll(options: options);
  }

  @override
  Future<List<T>> findAllById(List<ObjectId> ids) {
    return _datasource.findAllById(ids);
  }

  @override
  Future<T?> findOneById(ObjectId id) {
    return _datasource.findOneById(id);
  }

  @override
  Future<T> createOne(T entity) {
    return _datasource.createOne(entity);
  }

  @override
  Future<List<T>> createAll(List<T> entities) {
    return _datasource.createAll(entities);
  }

  @override
  Future<bool> updateOne(T entity) {
    return _datasource.updateOne(entity);
  }

  @override
  Future<bool> deleteOneById(ObjectId id) {
    return _datasource.deleteOneById(id);
  }

  @override
  Future<int> deleteAllById(List<ObjectId> ids) {
    return _datasource.deleteAllById(ids);
  }

  @override
  Future<int> countAll() {
    return _datasource.countAll();
  }

  @override
  Future<int> deleteAll() {
    return _datasource.deleteAll();
  }

  @override
  Future<List<T>> createAllIdOverride(List<T> entities) {
    return _datasource.createAllIdOverride(entities);
  }

  @override
  Future<T> createOneIdOverride(T entity) {
    return _datasource.createOneIdOverride(entity);
  }
}
