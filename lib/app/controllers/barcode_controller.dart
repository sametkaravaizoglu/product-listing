// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_product_test/app/data/enums/preferences_keys.dart';
import 'package:flutter_product_test/app/data/models/products_model.dart';
import 'package:flutter_product_test/core/init/cache/cache_manager.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_product_test/core/network/network_manager.dart';
import 'package:flutter_product_test/main_imports.dart';

class BarcodeController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  List<Product> products = [];

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() {
    final List? cachedProducts =
        CacheManager.instance.getValue(PreferencesKeys.savedProducts);
    if (cachedProducts == null) {
      CacheManager.instance.setValue(
        PreferencesKeys.savedProducts,
        [],
      );
      return;
    }

    List<Product> cachedProductsWithModel = [];
    for (var element in cachedProducts) {
      cachedProductsWithModel.add(Product.fromJson(element));
    }
    products = cachedProductsWithModel;
    update();
  }

  updateCache() {
    CacheManager.instance.setValue(
      PreferencesKeys.savedProducts,
      products,
    );
  }

  deleteItem(Product? product, BuildContext context) {
    if (product == null) {
      return;
    }
    if (!products.contains(product)) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          "item_remove_info".tr,
          // "$barcode barkodlu ürün bulunamadı",
          style: context.textTheme.titleMedium,
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "button_cancel".tr,
              style: context.textTheme.titleSmall,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              products.remove(product);
              updateCache();
              update();
            },
            child: Text(
              "button_delete".tr,
              style: context.textTheme.titleMedium?.copyWith(
                color: ColorManager.instance.darkRed,
              ),
            ),
          ),
        ],
      ),
    );
  }

  addProductToList(Product product) {
    if (products.contains(product)) {
      return;
    }
    products.add(product);
    updateCache();
    update();
  }

  getProduct(BuildContext context) async {
    final barcode = textEditingController.text;
    final Product? product = await NetworkManager.instance.get<Product>(
      path: "/products/$barcode",
      model: Product(),
      context: context,
    );
    if (product?.id != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            "barcode_found_text".trParams({"barcode": barcode}),
            style: context.textTheme.titleMedium,
          ),
          content: Column(
            children: [
              CachedNetworkImage(
                height: 160.h,
                width: MediaQuery.of(context).size.width / 2,
                imageUrl: product?.thumbnail ?? "",
                fit: BoxFit.contain,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    product?.brand ?? "",
                    style: context.textTheme.titleLarge,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    product?.title ?? "",
                    style: context.textTheme.titleSmall,
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                "button_cancel".tr,
                style: context.textTheme.titleSmall,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () {
                Navigator.pop(context);
                addProductToList(product!);
              },
              child: Text(
                "button_add".tr,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(
            "barcode_not_found_text".trParams({"barcode": barcode}),
            // "$barcode barkodlu ürün bulunamadı",
            style: context.textTheme.titleMedium,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => Navigator.pop(context),
              child: Text(
                "button_close".tr,
                style: context.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      );
    }
  }
}
