import 'dart:async';

import 'package:gp_backend/core/model/request_options.dart';
import 'package:gp_backend/feature/api/v1/data/base_datasource.dart';
import 'package:gp_backend/feature/api/v1/data/entity_collection_name.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';

import 'package:mongo_dart/mongo_dart.dart';

abstract class MongoDataSource<T extends BaseEntity>
    implements BaseDataSource<T> {
  final Db _db;
  bool indexesChecked = false;

  MongoDataSource(this._db);

  Future<Db> get db async {
    if (!_db.isConnected && _db.state != State.OPENING) {
      try {
        await _db.close();
        await _db.open();
        if (!indexesChecked) unawaited(createIndexes());
      } catch (err) {
        rethrow;
      }
    }

    while (_db.state == State.OPENING) {
      await Future.delayed(Duration(milliseconds: 100));
    }

    return _db;
  }

  /// Check and create indexes if they are not already created.
  Future<void> createIndexes() async {
    await _db.createIndex(EntityCollectionName.categories.name,
        key: 'parentId');


    indexesChecked = true;
  }

  SelectorBuilder createSelector(RequestOptions? options) {
    var selector = where;

    if (options?.page != null && options?.perPage != null) {
      selector = selector.skip(((options!.page! - 1) * options.perPage!));
      selector = selector.limit(options.perPage!);
    }

    if (options?.limit != null) {
      selector = selector.limit(options!.limit!);
    }

    if (options?.offset != null) {
      selector = selector.skip(options!.offset!);
    }

    if (options?.order != null && options?.orderBy != null) {
      if (options!.orderBy == 'id') {
        options.orderBy = '_id';
      }
      selector = selector.sortBy(options.orderBy!,
          descending: options.order!.index == 0 ? false : true);
    }

    return selector;
  }
}
