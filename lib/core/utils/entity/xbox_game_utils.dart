import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_platform_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_products_model.dart';
import 'package:gp_backend/core/model/metacritics_platform_type.dart';

const consoleGen8 = 'ConsoleGen8';
const consoleGen9 = 'ConsoleGen9';

class XboxGameUtils {
  XboxGameEntity fromEntity(XboxProductsModel model) {
    return XboxGameEntity(
      null,
      productId:model.productId,
      isMicrosoftProduct: model.isMicrosoftProduct ?? false,
      productType: model.productType ?? '',
      productKind: model.productKind ?? '',
      developerName: model.localizedProperties?[0].developerName ?? '',
      publisherName: model.localizedProperties?[0].publisherName ?? '',
      productDescription:
          model.localizedProperties?[0].productDescription ?? '',
      shortDescription: model.localizedProperties?[0].shortDescription ?? '',
      productTitle: model.localizedProperties?[0].productTitle ?? '',
      shortTitle: model.localizedProperties?[0].shortTitle ?? '',
      voiceTitle: model.localizedProperties?[0].voiceTitle ?? '',
      language: model.localizedProperties?[0].language ?? '',
      images: model.localizedProperties?[0].images,
      videos: model.localizedProperties?[0].videos,
      markets: model.localizedProperties?[0].markets,
      supportedLanguages: model.displaySkuAvailabilities?[0].sku
          ?.marketProperties?[0].supportedLanguages,
      xboxConsoleGenCompatible:
          getGenPlatform(model.properties?.xboxConsoleGenCompatible),
      xboxConsoleGenOptimized:
          getGenPlatform(model.properties?.xboxConsoleGenOptimized),
      categories: model.properties?.categories,
      category: model.properties?.category,
      packages: getPlatform(
          model.displaySkuAvailabilities?[0].sku?.properties?.platforms),
    );
  }

  List<PlatformModel>? getPlatform(Set<String>? platforms) {
    print('platforms = $platforms');
    List<PlatformModel> list = [];

    if(platforms != null) {
      for (var element in platforms) {
        list.add(PlatformModel(platform: element, metacriticScore: '0'));
      }
      return list;
    }else{
      return list;
    }
  }

  List<String>? getGenPlatform(List<String>? gens) {
    if (gens != null) {
      List<String> platforms = [];
      for (var gen in gens) {
        if (gen == consoleGen8) {
          platforms.add(MetacriticPlatform.xboxOne.name);
        } else if (gen == consoleGen9) {
          platforms.add(MetacriticPlatform.xboxSeriesX.name);
        } else {
          platforms.add(gen);
        }
      }
      return platforms;
    } else {
      return gens;
    }
  }
}
