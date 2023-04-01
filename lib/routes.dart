import 'package:get/get.dart';

import 'other.dart';
import 'ui.dart';

class Routes {
  static const String home = '/';
  static const String other = '/other';

  static List<GetPage> getPages = [
    GetPage(name: Routes.home, page: () => const Home()),
    GetPage(name: Routes.other, page: () => Other()),
  ];
}
