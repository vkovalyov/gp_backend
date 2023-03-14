import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:gp_backend/core/model/codable.dart';
import 'package:shelf/shelf.dart';

class ShelfUtils {
  static Response createResponseFromModel(Codable model,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus,
        body: jsonEncode(model),
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
  }

  static Response createResponseFromList(List<Codable> items,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus,
        body: jsonEncode(items),
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
  }

  static Response createResponseFromBytesImage(Uint8List bytes,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus, body: bytes, headers: {
      HttpHeaders.contentTypeHeader: ContentType.parse('image/jpeg').mimeType
    });
  }

  static Response createResponseFromBytesFile(Uint8List bytes,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus, body: bytes, headers: {
      HttpHeaders.contentTypeHeader:
          ContentType.parse('application/octet-stream').mimeType
    });
  }

  static Response createResponseFromStringList(List<String> items,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus,
        body: jsonEncode(items),
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
  }

  static Response createResponseFromBool(bool model,
      {int httpStatus = HttpStatus.ok}) {
    return Response(httpStatus,
        body: jsonEncode(model),
        headers: {HttpHeaders.contentTypeHeader: ContentType.json.value});
  }
}
