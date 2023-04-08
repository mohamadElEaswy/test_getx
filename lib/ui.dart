import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/api/base_url.dart';
import 'package:test_getx/api/dio.dart';
import 'package:test_getx/api/model.dart';
import 'package:test_getx/routes.dart';

import 'controller.dart';
// import 'other.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    final NetworkHelper network = Get.put(NetworkHelper.instance);

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
            leading: Text('title'.tr),
            title: Obx(() => Text("Clicks: ${c.count}"))),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: Column(
          children: [
            Center(
                child: ElevatedButton(
                    child: const Text("Go to Other"),
                    onPressed: () => Get.toNamed(Routes.other)
                    // Get.to(Other())
                    )),
            ElevatedButton(
              onPressed: () async {
                await network.dioInit();
                // late DataModel data;

                await network.get(path: BaseUrls.products).then((value) {
                  // data =

                  debugPrint(
                      DataModel.fromJson(value.data).data!.products![0].title);
                });
              },
              child: const Text('Test API'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment, child: const Icon(Icons.add)));
  }
}
