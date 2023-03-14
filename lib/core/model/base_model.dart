import 'package:equatable/equatable.dart';
import 'package:gp_backend/core/model/codable.dart';

abstract class BaseModel extends Equatable implements Codable {
  final String? id;

  toSqflite();

  BaseModel copyWith({String? id});

  const BaseModel({this.id});
}
