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
}
