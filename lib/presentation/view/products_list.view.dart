import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/app/core/routes/app_pages.dart';
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
            itemCount: controller.title.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.title[index]),
                onTap: () {
                  Get.toNamed(Routes.PRODUCTS_DETAILS_SCREEN);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
