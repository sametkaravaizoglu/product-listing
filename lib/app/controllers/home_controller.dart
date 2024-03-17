import 'package:flutter_product_test/app/data/models/products_model.dart';
import 'package:flutter_product_test/core/network/network_manager.dart';
import 'package:flutter_product_test/main_imports.dart';

class HomeController extends GetxController {
  HomeController({this.context});
  final BuildContext? context;

  ScrollController scrollController = ScrollController();
  ProductsModel? productsModel;
  DateTime? _lastEventTime;
  final dataLimit = 20;

  getProducts() async {
    productsModel = await NetworkManager.instance.get(
      path: "/products",
      model: ProductsModel(),
      queryParameters: {
        "skip": 0,
        "limit": dataLimit,
      },
      context: context,
    );

    attachScrollController();
    update();
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  attachScrollController() {
    scrollController.addListener(
      () {
        final currentPosition = scrollController.position.pixels;
        final maxScrollExtent = scrollController.position.maxScrollExtent;

        if (currentPosition / maxScrollExtent > 0.8) {
          final now = DateTime.now();
          if (_lastEventTime == null ||
              now.difference(_lastEventTime!) > const Duration(seconds: 1)) {
            _lastEventTime = now;
            loadMoreDataIfExists();
          }
        }
      },
    );
  }

  bool moreDataLoading = false;

  loadMoreDataIfExists() async {
    if (moreDataLoading) {
      return;
    } else {
      if ((productsModel?.products?.length ?? 0) <
          (productsModel?.total ?? 0)) {
        moreDataLoading = true;
        final ProductsModel newProducts = await NetworkManager.instance.get(
          path: "/products",
          model: ProductsModel(),
          queryParameters: {
            "skip": productsModel?.products?.length,
            "limit": dataLimit,
          },
          context: context,
        );
        newProducts.products?.forEach(
          (element) {
            if (productsModel?.products?.contains(element) == false) {
              productsModel?.products?.add(element);
            }
          },
        );
        moreDataLoading = false;
        update();
      }
    }
  }
}
