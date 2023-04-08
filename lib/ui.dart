import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/api/api_controller.dart';
// import 'package:test_getx/api/base_url.dart';
// import 'package:test_getx/api/dio.dart';
import 'package:test_getx/api/model.dart';

import 'controller.dart';
// import 'other.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  // final ``

  @override
  Widget build(context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    final Controller c = Get.put(Controller());
    final ApiController api = Get.put(ApiController());

    return Scaffold(
        // Use Obx(()=> to update Text() whenever count is changed.
        appBar: AppBar(
          title: Text('title'.tr),
          // title: Obx(() => Text("Clicks: ${c.count}"))
        ),

        // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
        body: FutureBuilder<RxList<Product>>(
          future: api.fetchProducts(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.data == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => Center(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(snapshot.data![index].title!),
                    )),
                  );
          },
        )
        // Column(
        //   children: [
        //     Center(
        //         child: ElevatedButton(
        //             child: const Text("Go to Other"),
        //             onPressed: () => Get.toNamed(Routes.other)
        //             // Get.to(Other())
        //             )),
        //     ElevatedButton(
        //       onPressed: () async {
        //         await network.dioInit();
        //         // late DataModel data;

        //         await network.get(path: BaseUrls.products).then((value) {
        //           // data =

        //           debugPrint(
        //               DataModel.fromJson(value.data).data!.products![0].title);
        //         });
        //       },
        //       child: const Text('Test API'),
        //     ),
        //   ],
        // )
        ,
        floatingActionButton: FloatingActionButton(
            onPressed: c.increment, child: const Icon(Icons.add)));
  }
}
