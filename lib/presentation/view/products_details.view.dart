import 'package:flutter/material.dart';
import 'package:sprout_test/app/config/color_constants.dart';
import 'package:sprout_test/app/core/base/base.view.dart';
import 'package:sprout_test/app/core/components/custom.appbar.dart';
import 'package:sprout_test/presentation/controller/products_details.controller.dart';

class ProductsDetailsView extends BaseView<ProductsDetailsController> {
  const ProductsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appbarTitle: const Text('Products Details'),
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
      body: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Image(
              image: NetworkImage(
                  'https://i.dummyjson.com/data/products/1/thumbnail.jpg'),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text('31231312313'),
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
                Text('11.1'),
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
                Text('11.1'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
