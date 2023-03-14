import 'package:gp_backend/feature/api/v1/domain/model/game_details/attributes.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/content_rating.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/image_tile.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/initial_addon_products.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/language_support.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/trailers.dart';

class Products {
  List<Attributes>? attributes;
  String? consoleComingSoonDate;
  String originalReleaseDate;
  int? approximateSizeInBytes;
  List<String>? xboxConsoleGenCompatible;
  String? xboxTitleId;
  String productTitle;
  String productDescription;
  String productType;
  String developerName;
  String publisherName;
  double reviewScore;
  int reviewCount;
  ImageTile? imageTile;
  ImageTile? imageHero;
  ImageTile? imagePoster;

  List<ImageTile>? screenshots;

  List<Trailers> trailers;
  List<String> categories;
  List<String> allowedPlatforms;

  ContentRating? contentRating;
  bool isEAPlay;
  bool requiresXboxLiveGold;

  List<InitialAddOnProducts> initialAddOnProducts;

  List<LanguageSupport> languageSupport;
  String storeId;

  Products(
      {required this.attributes,
      required this.approximateSizeInBytes,
      required this.consoleComingSoonDate,
      required this.originalReleaseDate,
      required this.xboxConsoleGenCompatible,
      required this.xboxTitleId,
      required this.productTitle,
      required this.productDescription,
      required this.productType,
      required this.developerName,
      required this.publisherName,
      required this.reviewScore,
      required this.reviewCount,
      required this.imageTile,
      required this.imageHero,
      required this.imagePoster,
      required this.trailers,
      required this.categories,
      required this.allowedPlatforms,
      required this.contentRating,
      required this.screenshots,
      required this.isEAPlay,
      required this.requiresXboxLiveGold,
      required this.initialAddOnProducts,
      required this.languageSupport,
      required this.storeId});

  factory Products.fromJson(Map<String, dynamic> json) {
    List<Attributes> attributes = [];
    if (json['Attributes'] != null) {
      attributes = <Attributes>[];
      json['Attributes'].forEach((v) {
        attributes.add(Attributes.fromJson(v));
      });
    }

    final imageTile = json['ImageTile'] != null
        ? ImageTile.fromJson(json['ImageTile'])
        : null;
    final imageHero = json['ImageHero'] != null
        ? ImageTile.fromJson(json['ImageHero'])
        : null;
    final imagePoster = json['ImagePoster'] != null
        ? ImageTile.fromJson(json['ImagePoster'])
        : null;

    List<ImageTile> screenshots = [];

    if (json['Screenshots'] != null) {
      json['Screenshots'].forEach((v) {
        screenshots.add(ImageTile.fromJson(v));
      });
    }
    List<Trailers> trailers = [];

    if (json['Trailers'] != null) {
      trailers = <Trailers>[];
      json['Trailers'].forEach((v) {
        trailers.add(Trailers.fromJson(v));
      });
    }

    final contentRating = (json['ContentRating'] != null
        ? ContentRating.fromJson(json['ContentRating'])
        : null);

    List<InitialAddOnProducts> initialAddOnProducts = [];
    if (json['InitialAddOnProducts'] != null) {
      initialAddOnProducts = <InitialAddOnProducts>[];
      json['InitialAddOnProducts'].forEach((v) {
        initialAddOnProducts.add( InitialAddOnProducts.fromJson(v));
      });
    }
    // if (json['RemainingAddOnProductStoreIds'] != null) {
    //   remainingAddOnProductStoreIds = new List<Null>();
    //   json['RemainingAddOnProductStoreIds'].forEach((v) {
    //     remainingAddOnProductStoreIds.add(new Null.fromJson(v));
    //   });
    // }

    Map? languageSupport = json['LanguageSupport'];

    List<LanguageSupport> languageSupportList = [];
    languageSupport?.forEach((key, value) {
      languageSupportList.add(LanguageSupport.fromJson(value, key));
    });
    //     ? new LanguageSupport.fromJson(json['LanguageSupport'])
    //     : null;
    //

    return Products(
      originalReleaseDate: json['OriginalReleaseDate'],
      approximateSizeInBytes: json['ApproximateSizeInBytes'] ,
      languageSupport: languageSupportList,
      initialAddOnProducts: initialAddOnProducts,
      contentRating: contentRating,
      trailers: trailers,
      attributes: attributes,
      requiresXboxLiveGold: json['RequiresXboxLiveGold'],
      imageTile: imageTile,
      imageHero: imageHero,
      imagePoster: imagePoster,
      screenshots: screenshots,
      isEAPlay: json['IsEAPlay'],
      categories: json['Categories'].cast<String>(),
      allowedPlatforms: json['AllowedPlatforms'].cast<String>(),
      storeId: json['StoreId'],
      xboxTitleId: json['XboxTitleId'],
      productTitle: json['ProductTitle'],
      productDescription: json['ProductDescription'],
      productType: json['ProductType'],
      developerName: json['DeveloperName'],
      publisherName: json['PublisherName'],
      reviewScore: json['ReviewScore'],
      reviewCount: json['ReviewCount'],
      consoleComingSoonDate: json['ConsoleComingSoonDate'],
      xboxConsoleGenCompatible: json['XboxConsoleGenCompatible']?.cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['StoreId'] = this.storeId;
    data['IsEAPlay'] = this.isEAPlay;
    data['ApproximateSizeInBytes'] = this.approximateSizeInBytes;
    data['ConsoleComingSoonDate'] = this.consoleComingSoonDate;
    data['OriginalReleaseDate'] = this.originalReleaseDate;
    data['XboxConsoleGenCompatible'] = this.xboxConsoleGenCompatible;
    data['XboxTitleId'] = this.xboxTitleId;
    data['ProductTitle'] = this.productTitle;
    data['ProductDescription'] = this.productDescription;
    data['ProductType'] = this.productType;
    data['DeveloperName'] = this.developerName;
    data['PublisherName'] = this.publisherName;
    data['ReviewScore'] = this.reviewScore;
    data['ReviewCount'] = this.reviewCount;
    data['Categories'] = this.categories;
    data['AllowedPlatforms'] = this.allowedPlatforms;
    data['ContentRating'] = this.contentRating?.toJson();
    data['Attributes'] = attributes?.map((v) => v.toJson()).toList();
    data['LanguageSupport'] =
        this.languageSupport.map((e) => e.toJson()).toList();
    data['ImageTile'] = this.imageTile?.toJson();
    data['ImageHero'] = this.imageHero?.toJson();
    data['ImagePoster'] = this.imagePoster?.toJson();

    data['Screenshots'] = this.screenshots?.map((v) => v.toJson()).toList();
    data['Trailers'] = this.trailers.map((v) => v.toJson()).toList();
    data['RequiresXboxLiveGold'] = this.requiresXboxLiveGold;
    data['InitialAddOnProducts'] =
        this.initialAddOnProducts.map((v) => v.toJson()).toList();

    return data;
  }
}
