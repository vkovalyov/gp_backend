import 'package:gp_backend/core/model/request_options.dart';
import 'package:gp_backend/feature/api/v1/data/entity_collection_name.dart';
import 'package:gp_backend/feature/api/v1/data/interface/mongo_datasource.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class MongoDatasourceImpl<T extends BaseEntity>
    extends MongoDataSource<T> {
  final String collectionName;
  final T Function(Map<String, dynamic> map) fromJson;

  MongoDatasourceImpl(
      {required this.collectionName, required Db db, required this.fromJson})
      : super(db);

  Future<DbCollection> get entityCollection async {
    return (await db).collection(collectionName);
  }

  @override
  Future<List<T>> findAll({RequestOptions? options}) async {
    final selector = createSelector(options);
    final entityMaps = await (await entityCollection).find(selector).toList();
    final entities =
        entityMaps.map((item) => fromJson(item)).toList(growable: false);

    return entities;
  }

  @override
  Future<List<T>> findAllById(List<ObjectId> ids) async {
    final entityMaps =
        await (await entityCollection).find(where.oneFrom('_id', ids)).toList();
    final entities =
        entityMaps.map((item) => fromJson(item)).toList(growable: false);
    return entities;
  }

  @override
  Future<T?> findOneById(ObjectId id) async {
    final entityMap = await (await entityCollection).findOne({'_id': id});
    if (entityMap == null) return null;
    return fromJson(entityMap);
  }

  @override
  Future<T> createOne(T entity) async {
    final validEntity = entity.copyWith(id: null);
    final result =
        await (await entityCollection).insertOne(validEntity.toJson());
    return fromJson(result.document!);
  }

  @override
  Future<List<T>> createAll(List<T> entities) async {
    final validEntities = entities.map((e) => e.copyWith(id: null));
    final serializedModels =
        validEntities.map((e) => e.toJson()).toList(growable: false);
    final result = await (await entityCollection).insertMany(serializedModels);
    return result.documents!.map((e) => fromJson(e)).toList();
  }

  @override
  Future<bool> deleteOneById(ObjectId id) async {
    final result = await (await entityCollection).deleteOne({'_id': id});
    if (result.nRemoved == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<int> deleteAllById(List<ObjectId> ids) async {
    final result =
        await (await entityCollection).deleteMany(where.oneFrom('_id', ids));
    return result.nRemoved;
  }

  @override
  Future<bool> updateOne(T entity) async {
    final result = await (await entityCollection)
        .replaceOne({'_id': entity.id}, entity.toJson());
    if (result.nMatched == 1) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<int> countAll() async {
    return (await entityCollection).count();
  }

  @override
  Future<int> deleteAll() async {
    final result = await (await entityCollection).deleteMany(null);
    return result.nRemoved;
  }

  @override
  Future<void> clearAllCollections() async {
    for (var collection in EntityCollectionName.values) {
      await (await db).collection(collection.name).remove(null);
    }
  }

  @override
  Future<T> createOneIdOverride(entity) async {
    final result = await (await entityCollection).insertOne(entity.toJson());
    return fromJson(result.document!);
  }

  @override
  Future<List<T>> createAllIdOverride(List<T> entities) async {
    final serializedModels =
        entities.map((e) => e.toJson()).toList(growable: false);
    final result = await (await entityCollection).insertMany(serializedModels);
    return result.documents!.map((e) => fromJson(e)).toList();
  }
}
