import 'package:gp_backend/feature/api/v1/domain/model/xbox_display_sku_availabilities_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_product_localization_properties_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_properties_model.dart';

class XboxProductsModel {
  final String? lastModifiedDate;
  final String? productId;
  final String? ingestionSource;
  final bool? isMicrosoftProduct;
  final String? preferredSkuId;
  final String? productType;
  final String? sandboxId;
  final String? productFamily;
  final bool? isSandboxedProduct;
  final String? productKind;
  List<LocalizedProperties>? localizedProperties;
  List<DisplaySkuAvailabilities>? displaySkuAvailabilities;
  Properties? properties;

  XboxProductsModel({
    required this.lastModifiedDate,
    required this.localizedProperties,
    required this.productId,
    required this.ingestionSource,
    required this.isMicrosoftProduct,
    required this.preferredSkuId,
    required this.productType,
    required this.sandboxId,
    required this.productFamily,
    required this.isSandboxedProduct,
    required this.productKind,
    required this.displaySkuAvailabilities,
    required this.properties,
  });

  factory XboxProductsModel.fromJson(Map<String, dynamic> json) {
    print('XboxProductsModel.fromJson $json');
    List<LocalizedProperties>? local;
    if (json['LocalizedProperties'] != null) {
      local = <LocalizedProperties>[];
      json['LocalizedProperties'].forEach((v) {
        local!.add(LocalizedProperties.fromJson(v));
      });
    }
    List<DisplaySkuAvailabilities>? displaySku;
    if (json['DisplaySkuAvailabilities'] != null) {
      displaySku = <DisplaySkuAvailabilities>[];
      json['DisplaySkuAvailabilities'].forEach((v) {
        displaySku!.add(DisplaySkuAvailabilities.fromJson(v));
      });
    }

    return XboxProductsModel(
      localizedProperties: local,
      productId: json['ProductId'],
      ingestionSource: json['IngestionSource'],
      isMicrosoftProduct: json['IsMicrosoftProduct'],
      preferredSkuId: json['PreferredSkuId'],
      productType: json['ProductType'],
      sandboxId: json['SandboxId'],
      productFamily: json['ProductFamily'],
      isSandboxedProduct: json['IsSandboxedProduct'],
      productKind: json['ProductKind'],
      lastModifiedDate: '',
      displaySkuAvailabilities: displaySku,
      properties: json['Properties'] != null
          ? Properties.fromJson(json['Properties'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['LocalizedProperties'] =
        localizedProperties!.map((v) => v.toJson()).toList();
    data['ProductId'] = productId;
    data['IngestionSource'] = ingestionSource;
    data['IsMicrosoftProduct'] = isMicrosoftProduct;
    data['PreferredSkuId'] = preferredSkuId;
    data['ProductType'] = productType;
    data['SandboxId'] = sandboxId;
    data['ProductFamily'] = productFamily;
    data['IsSandboxedProduct'] = isSandboxedProduct;
    data['ProductKind'] = productKind;
    data['DisplaySkuAvailabilities'] =
        displaySkuAvailabilities?.map((v) => v.toJson()).toList();
    data['Properties'] = properties?.toJson();

    return data;
  }
}
