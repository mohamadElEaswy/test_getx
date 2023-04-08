// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'api_controller.dart';
// import 'model.dart';

// class ExpansionPanelPage extends StatefulWidget {
//   const ExpansionPanelPage({super.key});

//   @override
//   State<ExpansionPanelPage> createState() => _ExpansionPanelPageState();
// }

// class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
//   @override
//   Widget build(BuildContext context) {
//     final ApiController api = Get.put(ApiController());

//     return Scaffold(
//       appBar: AppBar(title: Text('title'.tr)),
//       body: FutureBuilder<RxList<Product>>(
//         future: api.fetchProducts(),
//         builder: (context, snapshot) {
//           return snapshot.connectionState == ConnectionState.waiting ||
//                   snapshot.data == null
//               ? const Center(child: CircularProgressIndicator())
//               : ListView.builder(
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     // List<bool> openList = [];
//                     // openList.map((e) => e = false);
//                     // openList.ad
//                     return ExpansionPanelList(
//                       children: List.generate(
//                           snapshot.data!.length,
//                           (index) => ExpansionPanel(
//                                 headerBuilder: (context, isOpen) {
//                                   return Text(
//                                     snapshot.data![index].title!,
//                                     style: const TextStyle(fontSize: 20),
//                                   );
//                                 },
//                                 isExpanded: openList[index],
//                                 canTapOnHeader: true,
//                                 body: Text(snapshot.data![index].description!),
//                               )).toList(),
//                       animationDuration: const Duration(milliseconds: 600),
//                       elevation: 0.0,
//                       expansionCallback: (index, isItemOpen) =>
//                           setState(() => openList[index] = !isItemOpen),
//                     );
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
// /*
// Center(
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Text(snapshot.data![index].title!),
//                     ),
//                   )
//  */