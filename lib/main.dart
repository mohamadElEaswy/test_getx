import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      getPages: Routes.getPages,
      // home: Home()
    ),
  );
}

RxString name = 'Jonatas Borges'.obs;
