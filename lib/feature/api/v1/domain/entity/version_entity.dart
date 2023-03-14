import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:mongo_dart/mongo_dart.dart';

class VersionEntity extends BaseEntity {
  final String version;
  final DateTime updated;

  const VersionEntity(
      {ObjectId? id, required this.version, required this.updated})
      : super(id: id);

  @override
  List<Object?> get props => [id, version, updated];

  @override
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'version': version,
      'updated': updated,
    };
  }

  factory VersionEntity.fromJson(Map<String, dynamic> map) {
    return VersionEntity(
        id: map['_id'], version: map['version'], updated: map['updated']);
  }

  @override
  VersionEntity copyWith({
    ObjectId? id,
    String? version,
    DateTime? updated,
  }) {
    return VersionEntity(
        id: id ?? this.id,
        version: version ?? this.version,
        updated: updated ?? this.updated);
  }
}
