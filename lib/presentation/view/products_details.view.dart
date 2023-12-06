// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/presentation/controller/products_list.controller.dart';

class ProductsDetailsView extends BaseView<ProductsListController> {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appbarTitle: Text(controller.title.value),
        isTitleCenter: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingIcon: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.blackColor,
            size: 14,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Image(
              image: NetworkImage(controller.image.value),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    controller.description.value,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Price:',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(controller.price.toString()),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Discount Percentage:',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(controller.discountPercentage.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
