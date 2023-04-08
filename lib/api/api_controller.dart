import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_url.dart';
import 'dio.dart';
import 'model.dart';

class ApiController extends GetxController {
  final NetworkHelper network = Get.put(NetworkHelper.instance);
  Future<DataModel> getData() async {
    await network.dioInit();
    var response = await network.get(path: BaseUrls.products);
    return DataModel.fromJson(response.data);
  }

  RxList<Product> products = <Product>[].obs;
  Future<RxList<Product>> fetchProducts() async {
    var response = await network.get(path: BaseUrls.products);
    products = DataModel.fromJson(response.data).data!.products!.obs;
    debugPrint(products[0].title);
    return products;
  }
}
