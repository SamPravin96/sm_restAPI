import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sm_with_rest_api/controllers/productcontroller.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:sm_with_rest_api/views/product_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.blue),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.view_list_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.grid_view),
              ),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            print(productController.productList.length);
            if (productController.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                // itemBuilder: (context, int index) => Container(
                //   // height: 100,
                //   // width: 100,
                //   color: Colors.indigo,
                // ),
                itemBuilder: (context, int index) {
                  return ProductTile(
                    product: productController.productList[index],
                  );
                },
                staggeredTileBuilder: (int index) =>
                    // const StaggeredTile.count(1, 1),
                    const StaggeredTile.fit(1),
                // staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
              );
            }
          }),
        )
      ],
    );
  }
}

//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             children: [
//               const Expanded(
//                 child: Text(
//                   'ShopX',
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.view_list_rounded),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.grid_view),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: StaggeredGridView.countBuilder(
//             crossAxisCount: 4,
//             itemCount: 12,
//             mainAxisSpacing: 16,
//             crossAxisSpacing: 16,
//             itemBuilder: (context, int index) => Container(
//               // height: 100,
//               // width: 100,
//               color: Colors.indigo,
//             ),
//             staggeredTileBuilder: (int index) =>
//                 const StaggeredTile.count(2, 2),
//             // staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
//           ),
//         )
//       ],
//     );
//   }
// }
