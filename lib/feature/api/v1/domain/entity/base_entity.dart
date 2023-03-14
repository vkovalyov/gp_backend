import 'package:equatable/equatable.dart';
import 'package:gp_backend/core/model/codable.dart';
import 'package:mongo_dart/mongo_dart.dart';

abstract class BaseEntity extends Equatable implements Codable {
  final ObjectId? id;

  const BaseEntity({required this.id});
  BaseEntity copyWith({ObjectId? id});
}
