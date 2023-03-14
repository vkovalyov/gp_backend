import 'package:gp_backend/feature/api/v1/domain/model/xbox_market_properties_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_properties_model.dart';

class Sku {
  List<MarketProperties>? marketProperties;
  SkuProperties? properties;

  Sku({
    this.marketProperties,
    required this.properties,
  });

  Sku.fromJson(Map<String, dynamic> json) {
    if (json['MarketProperties'] != null) {
      marketProperties = <MarketProperties>[];
      json['MarketProperties'].forEach((v) {
        marketProperties!.add(MarketProperties.fromJson(v));
      });
      properties = json['Properties'] != null ?  SkuProperties.fromJson(json['Properties']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (marketProperties != null) {
      data['MarketProperties'] =
          marketProperties!.map((v) => v.toJson()).toList();
    }

    data['Properties'] = properties?.toJson();

    return data;
  }
}
