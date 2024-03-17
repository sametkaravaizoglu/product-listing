// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter_product_test/app/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeController Tests', () {
    late HomeController controller;

    setUp(() {
      controller = HomeController();
    });

    test('ProductsModel list is initially empty', () {
      expect(controller.productsModel, null);
    });

    test('Scrollcontroller is not attached', () async {
      expect(controller.scrollController.hasListeners, false);
    });

    test('GetProducts is working', () async {
      await controller.getProducts();
      expect(controller.productsModel?.products?.isNotEmpty, true);
    });

    test('Scrollcontroller is attached', () async {
      await controller.attachScrollController();
      expect(controller.scrollController.hasListeners, true);
    });

    test('Load more data when moreDataLoading true', () async {
      await controller.getProducts();
      int? expectedProductsLength = controller.productsModel?.products?.length;
      controller.moreDataLoading = true;
      await controller.loadMoreDataIfExists();
      expect(
          controller.productsModel?.products?.length, expectedProductsLength);
    });

    test('Load more data when moreDataLoading false', () async {
      await controller.getProducts();
      int? expectedProductsLength = controller.productsModel?.products?.length;
      if (expectedProductsLength != null) {
        expectedProductsLength += controller.dataLimit;
      }
      controller.moreDataLoading = false;
      await controller.loadMoreDataIfExists();
      expect(
          controller.productsModel?.products?.length, expectedProductsLength);
    });
  });
}
