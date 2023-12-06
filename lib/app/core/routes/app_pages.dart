import 'package:get/get.dart';
import 'package:sprout_test/presentation/binding/products_list.binding.dart';
import 'package:sprout_test/presentation/view/products_details.view.dart';
import 'package:sprout_test/presentation/view/products_list.view.dart';
part 'routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.PRODUCTS_LIST_SCREEN,
      page: () => const ProductsListView(),
      binding: ProductsListBinding(),
    ),
    GetPage(
      name: Routes.PRODUCTS_DETAILS_SCREEN,
      page: () => const ProductsDetailsView(),
      binding: ProductsListBinding(),
    ),
  ];
}
