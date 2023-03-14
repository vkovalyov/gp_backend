import 'package:gp_backend/feature/api/v1/domain/model/xbox_images_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_video_model.dart';

class LocalizedProperties {
  String? developerName;
  String? publisherName;
  String? publisherWebsiteUri;
  String? supportUri;

  List<Images>? images;
  List<Videos>? videos;
  String? productDescription;
  String? productTitle;
  String? shortTitle;
  String? sortTitle;

  String? shortDescription;

  String? voiceTitle;
  String? language;
  List<String>? markets;

  LocalizedProperties(
      {this.developerName,
      this.publisherName,
      this.publisherWebsiteUri,
      this.supportUri,
      this.productDescription,
      this.productTitle,
      this.shortTitle,
      this.sortTitle,
      this.shortDescription,
      this.voiceTitle,
      this.language,
      this.markets});

  LocalizedProperties.fromJson(Map<String, dynamic> json) {
    if (json['Images'] != null) {
      images = <Images>[];
      json['Images'].forEach((v) { images!.add(Images.fromJson(v)); });
    }
    if (json['Videos'] != null) {
      videos = <Videos>[];
      json['Videos'].forEach((v) { videos!.add(Videos.fromJson(v)); });
    }
    developerName = json['DeveloperName'];
    publisherName = json['PublisherName'];
    publisherWebsiteUri = json['PublisherWebsiteUri'];
    supportUri = json['SupportUri'];
    productDescription = json['ProductDescription'];
    productTitle = json['ProductTitle'];
    shortTitle = json['ShortTitle'];
    sortTitle = json['SortTitle'];
    shortDescription = json['ShortDescription'];
    voiceTitle = json['VoiceTitle'];
    language = json['Language'];
    markets = json['Markets'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['Images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['Videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['DeveloperName'] = developerName;
    data['PublisherName'] = publisherName;
    data['PublisherWebsiteUri'] = publisherWebsiteUri;
    data['SupportUri'] = supportUri;

    data['ProductDescription'] = productDescription;
    data['ProductTitle'] = productTitle;
    data['ShortTitle'] = shortTitle;
    data['SortTitle'] = sortTitle;

    data['ShortDescription'] = shortDescription;

    data['VoiceTitle'] = voiceTitle;
    data['Language'] = language;
    data['Markets'] = markets;
    return data;
  }
}
