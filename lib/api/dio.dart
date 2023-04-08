import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'base_url.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//  this is all network global methods
//  Network layer

class NetworkHelper {
//  'http://ecommerce-api.edgehub.agency/products'

  NetworkHelper._() {
    //  this work at first once when we use this class to init dio
    dioInit();
  }
  static final instance = NetworkHelper._();
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static Dio? dio;
  Future dioInit() async {
    dio = Dio(
      BaseOptions(
        headers: headers,
        baseUrl: BaseUrls.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> get({required String path, String? token
      // , String? lang = 'en'
      }) async {
    // final prefs = await SharedPreferences.getInstance();
    // String? locale = prefs.getString('locale');
    Response response = await dio!.get(
      path,
      queryParameters: {
        // 'lang': locale,
        'Authorization': 'Bearer $token'
      },
    );
    debugPrint(response.statusMessage.toString());
    debugPrint(response.statusCode.toString());
    debugPrint(response.data.toString());

    return response;
  }

  Future post(
          {required String path,
          required dynamic data,
          String? lang = 'en'}) async =>
      await dio!.post(
        path,
        data: data,
        queryParameters: {'lang': lang},
      );

  static Future<Response> put({
    required String url,
    required Map<String, dynamic> data,
    String? lang,
    String? token,
  }) async {
    return dio!.put(url,
        queryParameters: {'lang': lang, 'Authorization': 'Bearer $token'},
        data: data);
  }
  // static testApi() async {
  //   // Uri url = Uri.parse(BaseUrls.baseUrl);/
  //   // http.Response response = await http.get(url, headers: headers);
  //
  //   await dio!.get('/products').then((value) {
  //     List<SingleProduct>? products =
  //         HomeProducts.fromJson(value.data).data!.products;
  //     for (SingleProduct product in products!) {
  //       print(product.title);
  //     }
  //   });
  // }
}
