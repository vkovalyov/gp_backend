import 'package:equatable/equatable.dart';
import 'package:gp_backend/core/model/codable.dart';

class BaseException extends Equatable implements Exception, Codable {
  final int httpStatus;
  final String message;
  final String messageKey;

  const BaseException({
    required this.httpStatus,
    required this.message,
    required this.messageKey,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'messageKey': messageKey,
      'message': message,
      'httpStatus': httpStatus,
    };
  }

  factory BaseException.fromJson(Map<String, dynamic> map) {
    return BaseException(
      messageKey: map['messageKey'],
      message: map['message'],
      httpStatus: map['httpStatus'],
    );
  }

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [httpStatus, message, messageKey];
}
