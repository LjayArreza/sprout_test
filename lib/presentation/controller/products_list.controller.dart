// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sprout_test/app/core/base/base.controller.dart';
import 'package:sprout_test/app/core/routes/app_pages.dart';
import 'package:sprout_test/data/models/products_details.response.dart';
import 'package:sprout_test/data/models/products_list.response.dart';
import 'package:sprout_test/domain/repostories/products_repository.dart';

class ProductsListController extends BaseController {
  RxBool isLoading = false.obs;

  RxList products = [].obs;
  var titles = [''].obs;
  var thumb = [''].obs;
  var productIds = [0].obs;
  var title = ''.obs;
  var description = ''.obs;
  var discountPercentage = 0.0.obs;
  var price = 0.obs;
  var image = ''.obs;

  ProductsRepository productsRepository;
  ProductsListController(this.productsRepository);

  @override
  void onInit() {
    getProductsList();
    super.onInit();
  }

  Future<void> getProductsList() async {
    isLoading.value = true;
    var response = await productsRepository.productsList(10);

    if (response is ProductsListResponse) {
      isLoading.value = false;
      products.value = response.products!;
      titles.value = [];
      thumb.value = [];
      productIds.value = [];
      for (var prod in products.value) {
        titles.value.add(prod.title ?? "");
        thumb.value.add(prod.thumbnail ?? "");
        productIds.value.add(prod.id ?? 0);
      }
    } else {
      isLoading.value = false;
      debugPrint('ERROR LOADING RESPONSE');
    }
  }

  Future<void> getProductDetails(int productId) async {
    isLoading.value = true;
    var response = await productsRepository.productDetails(productId);

    if (response is ProductsDetailsResponse) {
      isLoading.value = false;
      title.value = response.title ?? "";
      description.value = response.description ?? "";
      discountPercentage.value = response.discountPercentage ?? 0.0;
      price.value = response.price ?? 0;
      image.value = response.thumbnail ?? '';
      Get.toNamed(Routes.PRODUCTS_DETAILS_SCREEN);
    } else {
      isLoading.value = false;
      debugPrint('ERROR LOADING RESPONSE');
    }
  }
}
