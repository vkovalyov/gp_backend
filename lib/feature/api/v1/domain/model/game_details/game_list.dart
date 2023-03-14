import 'dart:convert';

import 'package:bson/src/classes/object_id.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/products.dart';

class GameList extends BaseEntity {
  final List<Products>? products;

  GameList(ObjectId? id, {required this.products}) : super(id: id);

  factory GameList.fromJson(Map<String, dynamic> map) {
    final Map productListMap = map['Products'];
   // final json = jsonEncode(productListMap);

    // productListMap.map((key, value) => print(value));

    // final List<Products> products =
    //     productListMap.map((key, value) => Products.fromJson(value));

    List<Products> products = [];

    productListMap.forEach((key, value) {
      //print(jsonEncode(value));

     products.add(Products.fromJson(jsonDecode(jsonEncode(value))));
     //print(x.productTitle);
    });



    // print(jsonEncode(productListMap));
    // productListMap.map((value) => print(value));

    // final productList = productListMap
    //     .map((map) => Products.fromJson(jsonDecode(map)))
    //     .toList()
    //     .cast<Products>();
    return GameList(null, products: products);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Products'] = products?.map((e) => e.toJson());
    return data;
  }

  @override
  BaseEntity copyWith({ObjectId? id}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// class LanguageSupport {
//   DeDE deDE;
//   DeDE enUS;
//   DeDE enGB;
//   DeDE esES;
//   DeDE esMX;
//   DeDE frFR;
//   DeDE itIT;
//   DeDE jaJP;
//   DeDE koKR;
//
//   LanguageSupport({this.deDE,
//     this.enUS,
//     this.enGB,
//     this.esES,
//     this.esMX,
//     this.frFR,
//     this.itIT,
//     this.jaJP,
//     this.koKR});
//
//   LanguageSupport.fromJson(Map<String, dynamic> json) {
//     deDE = json['de-DE'] != null ? new DeDE.fromJson(json['de-DE']) : null;
//     enUS = json['en-US'] != null ? new DeDE.fromJson(json['en-US']) : null;
//     enGB = json['en-GB'] != null ? new DeDE.fromJson(json['en-GB']) : null;
//     esES = json['es-ES'] != null ? new DeDE.fromJson(json['es-ES']) : null;
//     esMX = json['es-MX'] != null ? new DeDE.fromJson(json['es-MX']) : null;
//     frFR = json['fr-FR'] != null ? new DeDE.fromJson(json['fr-FR']) : null;
//     itIT = json['it-IT'] != null ? new DeDE.fromJson(json['it-IT']) : null;
//     jaJP = json['ja-JP'] != null ? new DeDE.fromJson(json['ja-JP']) : null;
//     koKR = json['ko-KR'] != null ? new DeDE.fromJson(json['ko-KR']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.deDE != null) {
//       data['de-DE'] = this.deDE.toJson();
//     }
//     if (this.enUS != null) {
//       data['en-US'] = this.enUS.toJson();
//     }
//     if (this.enGB != null) {
//       data['en-GB'] = this.enGB.toJson();
//     }
//     if (this.esES != null) {
//       data['es-ES'] = this.esES.toJson();
//     }
//     if (this.esMX != null) {
//       data['es-MX'] = this.esMX.toJson();
//     }
//     if (this.frFR != null) {
//       data['fr-FR'] = this.frFR.toJson();
//     }
//     if (this.itIT != null) {
//       data['it-IT'] = this.itIT.toJson();
//     }
//     if (this.jaJP != null) {
//       data['ja-JP'] = this.jaJP.toJson();
//     }
//     if (this.koKR != null) {
//       data['ko-KR'] = this.koKR.toJson();
//     }
//     return data;
//   }
// }
//
// class DeDE {
//   int interfaceLanguageSupport;
//   int gamePlayAudioLanguageSupport;
//   int subtitlesLanguageSupport;
//
//   DeDE({this.interfaceLanguageSupport,
//     this.gamePlayAudioLanguageSupport,
//     this.subtitlesLanguageSupport});
//
//   DeDE.fromJson(Map<String, dynamic> json) {
//     interfaceLanguageSupport = json['InterfaceLanguageSupport'];
//     gamePlayAudioLanguageSupport = json['GamePlayAudioLanguageSupport'];
//     subtitlesLanguageSupport = json['SubtitlesLanguageSupport'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['InterfaceLanguageSupport'] = this.interfaceLanguageSupport;
//     data['GamePlayAudioLanguageSupport'] = this.gamePlayAudioLanguageSupport;
//     data['SubtitlesLanguageSupport'] = this.subtitlesLanguageSupport;
//     return data;
//   }
// }
