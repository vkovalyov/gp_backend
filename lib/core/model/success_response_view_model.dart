import 'package:gp_backend/core/model/codable.dart';

class SuccessResponseViewModel implements Codable {
  final bool success;

  SuccessResponseViewModel({required this.success});

  @override
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    return _data;
  }
}
