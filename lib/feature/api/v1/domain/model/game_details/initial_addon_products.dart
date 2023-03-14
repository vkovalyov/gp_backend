import 'package:gp_backend/feature/api/v1/domain/model/game_details/addon_image_tile.dart';

class InitialAddOnProducts {
  final String productTitle;
  final String developerName;
  final String publisherName;
  final AddonImageTile? imageTile;
  final AddonImageTile? imagePoster;

  String storeId;

  InitialAddOnProducts({
    required this.productTitle,
    required this.developerName,
    required this.publisherName,
    required this.imageTile,
    required this.imagePoster,
    required this.storeId,
  });

  factory InitialAddOnProducts.fromJson(Map<String, dynamic> json) {
    final imageTile = json['ImageTile'] != null
        ? AddonImageTile.fromJson(json['ImageTile'])
        : null;

    final imagePoster = json['ImagePoster'] != null
        ? AddonImageTile.fromJson(json['ImagePoster'])
        : null;

    return InitialAddOnProducts(
        imageTile: imageTile,
        imagePoster: imagePoster,
        productTitle: json['ProductTitle'],
        developerName: json['DeveloperName'],
        publisherName: json['PublisherName'],
        storeId: json['StoreId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductTitle'] = productTitle;
    data['DeveloperName'] = developerName;
    data['PublisherName'] = publisherName;
    if (imageTile != null) {
      data['ImageTile'] = imageTile?.toJson();
    }

    if (imagePoster != null) {
      data['ImagePoster'] = imagePoster?.toJson();
    }

    data['StoreId'] = storeId;
    return data;
  }
}
