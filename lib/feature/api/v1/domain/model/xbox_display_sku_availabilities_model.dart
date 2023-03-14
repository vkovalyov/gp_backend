import 'package:gp_backend/feature/api/v1/domain/model/xbox_sku_model.dart';

class DisplaySkuAvailabilities {
  Sku? sku;

  DisplaySkuAvailabilities({
    this.sku,
  });

  DisplaySkuAvailabilities.fromJson(Map<String, dynamic> json) {
    sku = json['Sku'] != null ? Sku.fromJson(json['Sku']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sku != null) {
      data['Sku'] = sku!.toJson();
    }
    return data;
  }
}
