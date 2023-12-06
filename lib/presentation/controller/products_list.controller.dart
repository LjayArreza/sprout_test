// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sprout_test/app/core/base/base.controller.dart';
import 'package:sprout_test/data/models/products_list.response.dart';
import 'package:sprout_test/domain/repostories/products_repository.dart';

class ProductsListController extends BaseController {
  RxBool isLoading = false.obs;

  RxList products = [].obs;
  var title = [''].obs;
  var thumb = [''].obs;

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
      title.value = [];
      thumb.value = [];
      for (var prod in products.value) {
        title.value.add(prod.title ?? "");
        thumb.value.add(prod.thumbnail ?? "");
        debugPrint('TITLES: ${title.value}');
        debugPrint('THUMB: ${thumb.value}');
      }
    } else {
      // isLoading.value = false;
      debugPrint('ERROR LOADING RESPONSE');
    }
  }
}
