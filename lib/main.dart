import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';
// import 'ui.dart';

void main() => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        getPages: Routes.getPages,
        // home: Home()
      ),
    );

RxString name = 'Jonatas Borges'.obs;
