import 'package:get/get.dart';
import 'package:sm_with_rest_api/models/product.dart';
import 'package:sm_with_rest_api/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;

  // var productList = List<Product>().obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
        // productList = products.cast<int>();

        print(" If Product List is ------> ");
        print(productList.value);
        print(products);
      }
    } finally {
      print(" Finally Product List is ------> ");
      print(productList.value);

      isLoading(false);
    }
  }
}
