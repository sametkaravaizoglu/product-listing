import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_product_test/app/controllers/barcode_controller.dart';
import 'package:flutter_product_test/app/data/models/products_model.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_product_test/main_imports.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
    required this.product,
    this.withDeleteIcon,
  });

  final Product? product;
  final bool? withDeleteIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: ColorManager.instance.gray.withOpacity(0.1),
          width: 1,
        ),
        color: ColorManager.instance.white,
        boxShadow: [
          BoxShadow(
            color: ColorManager.instance.gray.withOpacity(0.05),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.all(8.w),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      height: 160.h,
                      width: MediaQuery.of(context).size.width / 2,
                      imageUrl: product?.thumbnail ?? "",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Divider(
                color: ColorManager.instance.gray.withOpacity(
                  0.15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product?.brand ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                product?.title ?? "",
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Text(
                      product?.price != null ? "${product?.price}\$" : "",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  if (withDeleteIcon == true)
                    IconButton(
                      onPressed: () {
                        final controller = Get.find<BarcodeController>();
                        controller.deleteItem(product, context);
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
