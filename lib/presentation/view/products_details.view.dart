import 'package:flutter/material.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/presentation/controller/products_details.controller.dart';

class ProductsDetailsView extends BaseView<ProductsDetailsController> {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppbar(
      appbarTitle: Text('Products Details'),
      isTitleCenter: true,
      backgroundColor: AppColors.darkGrayColor,
      elevation: 1,
      automaticallyImplyLeading: true,
    );
  }
}
