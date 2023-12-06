import 'package:get/get.dart';
import 'package:sprout_test/app/core/base/base.binding.dart';
import 'package:sprout_test/domain/repostories/products_repository.dart';
import 'package:sprout_test/presentation/controller/products_details.controller.dart';

class ProductsDetailsBinding implements BaseBinding {
  @override
  void dependencies() {
    Get.lazyPut<ProductsDetailsController>(
        () => ProductsDetailsController(ProductsRepository()));
  }
}
