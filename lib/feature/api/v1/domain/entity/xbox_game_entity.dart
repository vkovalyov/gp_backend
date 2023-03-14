import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_platform_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_images_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_packages_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_video_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class XboxGameEntity extends BaseEntity {
  final String? productId;
  final bool isMicrosoftProduct;
  final String productType;
  final String productKind;

  final String developerName;
  final String publisherName;
  final String productDescription;
  final String shortDescription;

  final String productTitle;
  final String shortTitle;
  final String voiceTitle;

  final String language;
  final List<String>? markets;
  final List<Images>? images;
  final List<Videos>? videos;
  final List<String>? supportedLanguages;

  final String? category;
  final List<String>? categories;
  final List<String>? xboxConsoleGenOptimized;
  final List<String>? xboxConsoleGenCompatible;
  List<PlatformModel>? packages;

  XboxGameEntity(
    ObjectId? id, {
      required this.productId,
    required this.isMicrosoftProduct,
    required this.productType,
    required this.productKind,
    required this.developerName,
    required this.publisherName,
    required this.productDescription,
    required this.shortDescription,
    required this.productTitle,
    required this.shortTitle,
    required this.voiceTitle,
    required this.language,
    required this.images,
    required this.videos,
    required this.markets,
    required this.supportedLanguages,
    required this.category,
    required this.categories,
    required this.xboxConsoleGenOptimized,
    required this.xboxConsoleGenCompatible,
    required this.packages,
  }) : super(id: id);

  @override
  BaseEntity copyWith({ObjectId? id}) {
    throw UnimplementedError();
  }

  @override
  List<Object?> get props => [
        id,
    productId,
        isMicrosoftProduct,
        productType,
        productKind,
        developerName,
        publisherName,
        productDescription,
        shortDescription,
        productTitle,
        shortTitle,
        voiceTitle,
        language,
        images,
        videos,
        markets,
        supportedLanguages,
        category,
        categories,
        xboxConsoleGenOptimized,
        xboxConsoleGenCompatible,
        packages,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId':productId,
      'isMicrosoftProduct': isMicrosoftProduct,
      'productType': productType,
      'productKind': productKind,
      'developerName': developerName,
      'publisherName': publisherName,
      'productDescription': productDescription,
      'shortDescription': shortDescription,
      'productTitle': productTitle,
      'shortTitle': shortTitle,
      'voiceTitle': voiceTitle,
      'language': language,
      'images': images,
      'videos': videos,
      'markets': markets,
      'supportedLanguages': supportedLanguages,
      'category': category,
      'categories': categories,
      'xboxConsoleGenOptimized': xboxConsoleGenOptimized,
      'xboxConsoleGenCompatible': xboxConsoleGenCompatible,
      'packages': packages,
    };
  }
}
