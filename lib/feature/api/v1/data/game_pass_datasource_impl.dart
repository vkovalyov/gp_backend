import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gp_backend/core/utils/entity/xbox_game_utils.dart';
import 'package:gp_backend/feature/api/v1/data/interface/game_pass_datasource.dart';
import 'package:gp_backend/feature/api/v1/data/mongo_datasource_impl.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/base_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/entity/xbox_game_entity.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_details/game_list.dart';
import 'package:gp_backend/feature/api/v1/domain/model/game_pass_object_model.dart';
import 'package:gp_backend/feature/api/v1/domain/model/xbox_list_products_model.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';
import 'package:mongo_dart/mongo_dart.dart';

const xboxPlatform =
    'https://catalog.gamepass.com/sigls/v2?id=f6f1f99f-9b49-4ccd-b3bf-4d9767a77f5e&language=ru-us&market=RU';
const desktopPlatform =
    'https://catalog.gamepass.com/sigls/v2?id=fdd9e2a7-0fee-49f6-ad69-4354098401ff&language=ru-ru&market=RU';

String getUrl(String ids) =>
    'https://displaycatalog.mp.microsoft.com/v7.0/products?bigIds=$ids&market=RU&languages=ru-ru&MS-CV=DGU1mcuYo0WMMp+F.1';

const String consoleGen8 = 'xbox-series-x';
const String consoleGen9 = 'xbox-series-x';

const String desktop = 'Desktop';
const String xbox = 'Xbox';

const criticReviews = 'critic-reviews';
const userReviews = 'user-reviews';

class GamePassDatasourceImpl extends MongoDatasourceImpl<BaseEntity>
    implements GamePassDatasource {
  final Dio dio;
  final Logger logger;

  GamePassDatasourceImpl(
      {required String collectionName,
      required Db db,
      required BaseEntity Function(Map<String, dynamic> map) fromJson,
      required this.dio,
      required this.logger})
      : super(collectionName: collectionName, db: db, fromJson: fromJson);

  @override
  Future<List<XboxGameEntity>?> findAllByDesktopPlatform() async {
    final response = await dio.get(desktopPlatform);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception;
    }

    List<GamePassObjectModel> models = response.data
        .map((e) => GamePassObjectModel.fromJson(e))
        .toList()
        .cast<GamePassObjectModel>();

    models.removeWhere((element) => element.id == null);

    final ids = models.map((e) => e.id!).toList();
    logger.d(
        'GamePassDatasource method findAllByDesktopPlatform - find ${ids.length} ids');

    final list = await findAllByIds(ids);

    return list;
  }

  @override
  Future<GameList?> findAllByXboxPlatform() async {
    final responseDesktopPlatform = await dio.get(desktopPlatform);
    if (responseDesktopPlatform.statusCode != HttpStatus.ok) {
      throw 'не смог в пс';
    }

    final responseXboxPlatform = await dio.get(desktopPlatform);
    if (responseXboxPlatform.statusCode != HttpStatus.ok) {
      throw 'не смог в бокс';
    }

    // List<GamePassObjectModel> desktopIds = responseDesktopPlatform.data
    //     .map((e) => GamePassObjectModel.fromJson(e)).toList();

    List<GamePassObjectModel> desktopIdsObject = responseDesktopPlatform.data
        .map((e) => GamePassObjectModel.fromJson(e))
        .toList()
        .cast<GamePassObjectModel>();

    //print('desktopIds :$desktopIds');

    // List<GamePassObjectModel> xBoxIds = responseXboxPlatform.data
    //     .map((e) => GamePassObjectModel.fromJson(e)).toList();

    List<GamePassObjectModel> xBoxIdsObject = responseXboxPlatform.data
        .map((e) => GamePassObjectModel.fromJson(e))
        .toList()
        .cast<GamePassObjectModel>();

    //print('xBoxIds :$xBoxIds');

    desktopIdsObject.removeWhere((element) => element.id == null);
    xBoxIdsObject.removeWhere((element) => element.id == null);

    final xBoxIds = xBoxIdsObject.map((e) => "\"${e.id}\"").toList();
    final desktopIds = desktopIdsObject.map((e) => "\"${e.id}\"").toList();

    final ids = {...xBoxIds,...desktopIds}.toList();



    print('ids = $ids');

    final url =
        'https://catalog.gamepass.com/products?market=ru&language=ru-RU&hydration=MobileDetailsForConsole';
    final response = await dio.post(url,
        data: '{"Products":  ${ids} }');

    if (response.statusCode != HttpStatus.ok) {
      print('status error');
    }

    final entities = GameList.fromJson(response.data);
    // print('1');
    // Map parseJson = response.data['Products'];
    //
    // print('2');
    // parseJson.forEach((key, value) {
    //   print(jsonEncode(value));
    // });

    // final response = await dio.get(xboxPlatform);
    // if (response.statusCode != HttpStatus.ok) {
    //   throw Exception;
    // }
    /// нужен set  чтоб смапить 2 списка от бокса и от компа
    /// и уже эти id отправлять скопом 1 запросом на получение данных по играм
    // List<GamePassObjectModel> models = response.data
    //     .map((e) => GamePassObjectModel.fromJson(e))
    //     .toList()
    //     .cast<GamePassObjectModel>();
    //
    // models.removeWhere((element) => element.id == null);
    //
    // final ids = models.map((e) => e.id!).toList();
    //
    // logger.d(
    //     'GamePassDatasource method findAllByXboxPlatform - find ${ids.length} ids');
    //
    // final list = await findAllByIds(ids);
    //
    // return list;

    //getMetacriticUserScore();
    // getMetacriticCriticScore();
    return entities;
  }

  @override
  Future<List<XboxGameEntity>?> findAllByIds(List<String> ids) async {
    final response = await dio.get(getUrl(ids.join(',')));
    if (response.statusCode != HttpStatus.ok) {
      throw Exception;
    }

    final XboxListProductsModel models =
        XboxListProductsModel.fromJson(response.data);

    final entities =
        models.products?.map((e) => XboxGameUtils().fromEntity(e)).toList();

    final serializedEntites =
        entities?.map((e) => e.toJson()).toList(growable: false);

    if (serializedEntites != null) {
      // await (await entityCollection).insertMany(serializedEntites);
    }

    return entities;
  }

  getMetacriticUserScore() async {
    final response = await dio
        .get('https://www.metacritic.com/game/playstation-5/cult-of-the-lamb');
    if (response.statusCode != HttpStatus.ok) {
      throw Exception;
    }

    final document = parse(response.data);

    final score = document
        .getElementsByClassName('metascore_w user large game mixed')[0]
        .text;

    print('User score = $score');
  }

  getMetacriticCriticScore() async {
    final response = await dio
        .get('https://www.metacritic.com/game/playstation-4/cult-of-the-lamb');
    if (response.statusCode != HttpStatus.ok) {
      throw Exception;
    }

    final document = parse(response.data);

    final score = document.getElementsByClassName('metascore_anchor');

    //print('score lenght = ${score.length}');

    String criticScore = '';
    String userScore = '';

//const criticReviews = 'critic-reviews';
// const userReviews = 'user-reviews';
    score.forEach((element) {
      //print('document = ${element.text}');
      //print(element.attributes);

      element.attributes.forEach((key, value) {
        if (value.contains(criticReviews)) {
          criticScore = element.text;
        }

        if (value.contains(userReviews)) {
          userScore = element.text;
        }
        // print('key= $key | value = $value');
      });

      //print(element.text);
    });

    print('Critic score = $score');
    print('userScore = $userScore');
    print('criticScore = $criticScore');
  }
}
