import 'package:logger/logger.dart';
import 'package:sprout_test/app/services/api/api_endpoint.dart';
import 'package:sprout_test/app/services/api/api_method.dart';
import 'package:sprout_test/app/services/dio_service.dart';
import 'package:sprout_test/data/models/products_list.response.dart';

class ProductsRepository {
  DioHttpService httpService = DioHttpService();
  final logger = Logger();
  ProductsRepository();

  Future<dynamic> productsList(int limit) async {
    httpService.init();
    try {
      var response = await httpService.request(
        url:
            "${APIEndpoint.PRODUCTS}?limit=$limit&select=title,price,thumbnail,stock,discountPercentage",
        method: ApiMethod.GET,
      );

      if (response.statusCode == 200) {
        return ProductsListResponse.fromJson(response.data);
      } else {
        return 'Error response';
      }
    } catch (e) {
      logger.e(e);
    }
  }
}
