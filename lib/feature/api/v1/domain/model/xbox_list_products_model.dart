import 'package:gp_backend/feature/api/v1/domain/model/xbox_products_model.dart';

class XboxListProductsModel {
  List<XboxProductsModel>? products;

  XboxListProductsModel({this.products});

  XboxListProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['Products'] != null) {
      products = <XboxProductsModel>[];
      json['Products'].forEach((v) {
        products!.add(XboxProductsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['Products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
