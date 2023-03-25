import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../core/api.dart';
import '../core/config/doi_config.dart';
import '../models/cards_model.dart';
import 'log_service.dart';

class CardService {
  static final CardService _inheritance = CardService._init();
  static CardService get inheritance => _inheritance;
  CardService._init();

  static Future<Either<String,List<CardsModel>>> getCards() async {
    try {
      Response response = await DioConfig.inheritentce.createRequest().get(Urls.getCards);
      Log.i(response.data.toString());
      Log.i(response.statusCode.toString());

      if(response.statusCode == 200) {
        List<CardsModel> UserList = [];
        for(var e in (response.data as List)) {
          UserList.add(CardsModel.fromJson(e));
        }

        return right(UserList);
      } else{
        Log.e( response.data.toString());
        return left(response.data.toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if((e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left((e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
    //   else {
    //     Log.e('${res.statusMessage} ${res.statusCode}');
    //   }
    // } on DioError catch (e) {
    //   Log.e(e.toString());
    //   if(e.response != null) {
    //     Log.e(e.response!.toString());
    //   } else {
    //     rethrow;
    //   }
    // } catch (e) {
    //   Log.e(e.toString());
    //
    // }
    // return left(null);
  }

  static Future<bool> deleteCard(String id) async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().delete(
        Urls.deleteCard + id.toString(),
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
    // return null;
  }

  static Future<bool> createUser(CardsModel newCards) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().post(
        Urls.getCards,
        data:  {
          "id" : newCards.id,
          "name" : newCards.name,
          "cost" : newCards.cost,
          "date" : newCards.date,
        }
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}

}

