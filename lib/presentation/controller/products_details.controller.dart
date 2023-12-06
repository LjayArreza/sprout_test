import 'package:sprout_test/app/core/base/base.controller.dart';
import 'package:sprout_test/domain/repostories/products_repository.dart';

class ProductsDetailsController extends BaseController {
  ProductsRepository repo;
  ProductsDetailsController(this.repo);
}
