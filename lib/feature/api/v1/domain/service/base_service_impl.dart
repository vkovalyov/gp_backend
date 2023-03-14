import 'dart:io';

import 'package:gp_backend/core/errors/base_exception.dart';
import 'package:gp_backend/core/errors/error_message.dart';
import 'package:gp_backend/core/model/request_options.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/repository/interface/base_repository.dart';
import 'package:gp_backend/feature/api/v1/domain/service/interface/base_service.dart';
import 'package:logger/logger.dart';
import 'package:mongo_dart/mongo_dart.dart';

class BaseServiceImpl<T extends BaseEntity> extends BaseService<T> {
  final BaseRepository<T> _repository;
  final Logger _baseLogger;

  BaseServiceImpl(this._repository, this._baseLogger);

  @override
  Future<List<T>> findAll({RequestOptions? options}) {
    _baseLogger
        .d('$runtimeType method findAll is called with options: $options');
    options?.validate(T);
    return _repository.findAll(options: options);
  }

  @override
  Future<List<T>> findAllById(List<ObjectId> ids) {
    _baseLogger.d('$runtimeType method findAllById is called with ids: $ids');
    return _repository.findAllById(ids);
  }

  @override
  Future<T> findOneById(ObjectId id) async {
    _baseLogger.d('$runtimeType method findOneById is called with id: $id');
    final entity = await _repository.findOneById(id);
    if (entity == null) {
      final message = '${T.toString()} ${ErrorMessage.notFound}';
      throw BaseException(
          message: message,
          messageKey: message.toLowerCase(),
          httpStatus: HttpStatus.notFound);
    }
    return entity;
  }

  @override
  Future<T> createOne(T entity) {
    _baseLogger
        .d('$runtimeType method createOne is called with entity: $entity');
    return _repository.createOne(entity);
  }

  @override
  Future<List<T>> createAll(List<T> entities) {
    _baseLogger
        .d('$runtimeType method createAll is called with entities: $entities');
    return _repository.createAll(entities);
  }

  @override
  Future<bool> deleteOneById(ObjectId id) {
    _baseLogger.d('$runtimeType method deleteOneById is called with id: $id');
    return _repository.deleteOneById(id);
  }

  @override
  Future<int> deleteAllById(List<ObjectId> ids) {
    _baseLogger.d('$runtimeType method deleteAllById is called with ids: $ids');
    return _repository.deleteAllById(ids);
  }

  @override
  Future<bool> updateOne(T entity) {
    _baseLogger
        .d('$runtimeType method updateOne is called with entity: $entity');
    return _repository.updateOne(entity);
  }

  @override
  Future<int> countAll() {
    _baseLogger.d('$runtimeType method countAll is called');
    return _repository.countAll();
  }

  @override
  Future<int> deleteAll() {
    _baseLogger.d('$runtimeType method deleteAll is called');
    return _repository.deleteAll();
  }
}
