import 'package:get/get.dart';

// import 'api/expansion_panel_ui.dart';
import 'other.dart';
import 'ui.dart';

class Routes {
  static const String home = '/';
  static const String other = '/other';

  static List<GetPage> getPages = [
    // GetPage(name: Routes.home, page: () => const ExpansionPanelPage()),
    GetPage(name: Routes.home, page: () => const Home()),
    GetPage(name: Routes.other, page: () => Other()),
  ];
}
