import 'package:flutter/material.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/presentation/controller/products_list.controller.dart';

class ProductsListView extends BaseView<ProductsListController> {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppbar(
      appbarTitle: Text('Products List'),
      isTitleCenter: true,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      automaticallyImplyLeading: true,
    );
  }
}
