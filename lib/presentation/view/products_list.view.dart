import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/presentation/controller/products_list.controller.dart';

class ProductsListView extends BaseView<ProductsListController> {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressHUD(
        key: UniqueKey(),
        inAsyncCall: controller.isLoading.value,
        child: Scaffold(
          appBar: const CustomAppbar(
            appbarTitle: Text('Products List'),
            isTitleCenter: true,
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            automaticallyImplyLeading: false,
          ),
          body: ListView.builder(
            shrinkWrap: false,
            itemCount: controller.titles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.titles[index]),
                onTap: () {
                  controller.getProductDetails(controller.productIds[index]);
                },
              );
            },
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.getProductsListSkip(false);
                  },
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.getProductsListSkip(true);
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
