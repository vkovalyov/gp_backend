import 'package:gp_backend/feature/api/v1/domain/model/xbox_packages_model.dart';

class SkuProperties {
  List<Packages>? packages;
  Set<String>? platforms;

  SkuProperties({ this.packages,});

  SkuProperties.fromJson(Map<String, dynamic> json) {
    if (json['Packages'] != null) {
      packages = <Packages>[];
      json['Packages'].forEach((v) {
        packages?.add(Packages.fromJson(v));
      });

      platforms = {};

      packages?.forEach((element) {
        platforms?.addAll(element.platforms ?? []);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Packages'] = packages?.map((v) => v.toJson()).toList();
    return data;
  }
}

class Properties {
  String? category;
  List<String>? categories;

  bool? isAccessible;
  bool? isDemo;

  List<String>? xboxConsoleGenOptimized;
  List<String>? xboxConsoleGenCompatible;
  bool? xboxLiveGoldRequired;

  String? isPrivateBeforeDateHint;

  Properties({
    this.category,
    this.categories,
    this.isAccessible,
    this.isDemo,
    this.xboxConsoleGenOptimized,
    this.xboxConsoleGenCompatible,
    this.xboxLiveGoldRequired,
    this.isPrivateBeforeDateHint,
  });

  Properties.fromJson(Map<String, dynamic> json) {
    category = json['Category'] ?? '';
    categories = json['Categories'] != null
        ? json['Categories']?.cast<String>() ?? ''
        : null;
    isAccessible = json['IsAccessible'];
    isDemo = json['IsDemo'];
    xboxConsoleGenOptimized =
        json['XboxConsoleGenOptimized']?.cast<String>() ?? [];
    xboxConsoleGenCompatible =
        json['XboxConsoleGenCompatible']?.cast<String>() ?? [];
    xboxLiveGoldRequired = json['XboxLiveGoldRequired'];
    isPrivateBeforeDateHint = json['IsPrivateBeforeDateHint'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['Category'] = category;
    data['Categories'] = categories;
    data['IsAccessible'] = isAccessible;
    data['IsDemo'] = isDemo;
    data['XboxConsoleGenOptimized'] = xboxConsoleGenOptimized;
    data['XboxConsoleGenCompatible'] = xboxConsoleGenCompatible;
    data['XboxLiveGoldRequired'] = xboxLiveGoldRequired;
    data['IsPrivateBeforeDateHint'] = isPrivateBeforeDateHint;
    return data;
  }
}
