import 'package:flutter_test/flutter_test.dart';
import 'package:logger/src/logger.dart';
import 'package:sprout_test/app/services/dio_service.dart';
import 'package:sprout_test/data/models/products_list.response.dart';
import 'package:sprout_test/domain/repostories/products_repository.dart';
import 'package:sprout_test/presentation/controller/products_list.controller.dart';

class TestProductsRepository implements ProductsRepository {
  @override
  Future<dynamic> productsList(int limit, int skip) async {
    // Sample product data
    final sampleProductsData = {
      "products": [
        {
          "id": 1,
          "title": "iPhone 9",
          "price": 549,
          "thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg",
          "stock": 94
        },
        // Add other products...
      ],
      "total": 100,
      "skip": 0,
      "limit": 10,
    };

    return ProductsListResponse.fromJson(sampleProductsData);
  }

  @override
  Future<dynamic> productDetails(int productId) {
    throw UnimplementedError(); // Implement if needed for specific tests
  }

  @override
  late DioHttpService httpService;

  @override
  Logger get logger => throw UnimplementedError();
}

void main() {
  group('ProductsListController', () {
    late ProductsListController controller;
    late TestProductsRepository testRepository;

    setUp(() {
      testRepository = TestProductsRepository();
      controller = ProductsListController(testRepository);
    });

    test('getProductsList updates the state correctly on success', () async {
      // Call the method you want to test
      await controller.getProductsList();

      // Make assertions based on the expected behavior
      expect(controller.isLoading.value, false);
      expect(
          controller.products.length, 1); // Assuming you want to load 1 product
      // Add more expectations for other state changes
    });

    // Add more tests for other controller methods and edge cases
  });
}
