import 'dart:io';
import 'dart:mirrors';

import 'package:gp_backend/core/errors/base_exception.dart';
import 'package:gp_backend/core/errors/error_message.dart';
import 'package:shelf/shelf.dart';

const _pageParam = 'page';
const _perPageParam = 'per_page';
const _orderParam = 'order';
const _orderby = 'orderby';
const _offset = 'offset';
const _limit = 'limit';

const _defaultPage = 1;
const _defaultPerPageCount = 10;
const _defaultOrderByValue = 'id';

enum OrderEnum { asc, dsc }

class RequestOptions {
  int? page;
  int? perPage;
  OrderEnum? order;
  String? orderBy;
  int? offset;
  int? limit;

  RequestOptions.fromRequest(Request req) {
    page = _getPageParam(req);
    perPage = _getPerPageParam(req);
    order = _getOrderParam(req);
    orderBy = _getOrderByParam(req);
    offset = _getOffsetParam(req);
    limit = _getLimitParam(req);

    logicalCheck();
  }

  void logicalCheck() {
    if (page != null && perPage == null) {
      perPage = _defaultPerPageCount;
    }

    if (page == null && perPage != null) {
      page = _defaultPage;
    }

    if (order != null && orderBy == null) {
      orderBy = _defaultOrderByValue;
    }

    if (order == null && orderBy != null) {
      order = OrderEnum.asc;
    }

    if (limit != null && page != null) {
      if (limit! > perPage!) {
        limit = perPage;
      }
    }
  }

  @override
  String toString() {
    return '$page $perPage ${order.toString()} $orderBy $offset $limit';
  }

  int? _getPageParam(Request req) {
    if (req.url.queryParameters[_pageParam] == null) {
      return null;
    } else {
      final result = int.tryParse(req.url.queryParameters[_pageParam] ?? '');
      if (result == null) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.pageMustBeInteger,
            messageKey: ErrorMessage.pageMustBeIntegerKey);
      }
      return result;
    }
  }

  int? _getPerPageParam(Request req) {
    if (req.url.queryParameters[_perPageParam] == null) {
      return null;
    } else {
      final result = int.tryParse(req.url.queryParameters[_perPageParam] ?? '');
      if (result == null) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.perPageMustBeInteger,
            messageKey: ErrorMessage.perPageMustBeIntegerKey);
      }
      return result;
    }
  }

  OrderEnum? _getOrderParam(Request req) {
    if (req.url.queryParameters[_orderParam] == null) {
      return null;
    } else {
      final result = OrderEnum.values.where(
          (element) => element.name == req.url.queryParameters[_orderParam]);
      if (result.isEmpty) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.orderMustBeAscDsc,
            messageKey: ErrorMessage.orderMustBeAscDscKey);
      } else {
        return result.first;
      }
    }
  }

  String? _getOrderByParam(Request req) {
    return req.url.queryParameters[_orderby];
  }

  int? _getOffsetParam(Request req) {
    if (req.url.queryParameters[_offset] == null) {
      return null;
    } else {
      final result = int.tryParse(req.url.queryParameters[_offset] ?? '');
      if (result == null) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.offsetMustBeInteger,
            messageKey: ErrorMessage.offsetMustBeIntegerKey);
      }
      return result;
    }
  }

  int? _getLimitParam(Request req) {
    if (req.url.queryParameters[_limit] == null) {
      return null;
    } else {
      final result = int.tryParse(req.url.queryParameters[_limit] ?? '');
      if (result == null) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.limitMustBeInteger,
            messageKey: ErrorMessage.limitMustBeIntegerKey);
      }
      return result;
    }
  }

  bool validate(Type type) {
    if (orderBy != null) {
      ClassMirror cm = reflectClass(type);
      final result =
          cm.declarations.values.whereType<VariableMirror>().where((element) {
        return MirrorSystem.getName(element.simpleName) == orderBy;
      }).isNotEmpty;
      if (result == false) {
        throw BaseException(
            httpStatus: HttpStatus.badRequest,
            message: ErrorMessage.fieldOrderByNoExist,
            messageKey: ErrorMessage.fieldOrderByNoExistKey);
      }
      return result;
    } else {
      return true;
    }
  }
}
