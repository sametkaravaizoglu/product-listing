import 'package:flutter/material.dart';
import 'package:flutter_product_test/app/ui/pages/home_page/widgets/product_widget.dart';
import 'package:flutter_product_test/app/ui/utils/b_textformfield.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/barcode_controller.dart';

class BarcodePage extends GetView<BarcodeController> {
  const BarcodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BarcodeController>(
      init: BarcodeController(),
      autoRemove: false,
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            surfaceTintColor: ColorManager.instance.white,
            title: BTextFormField.widget(
              context: context,
              controller: c.textEditingController,
              leadingIcon: const Icon(
                Icons.barcode_reader,
              ),
              suffixIcon: IconButton(
                onPressed: () => c.getProduct(context),
                icon: const Icon(Icons.search),
              ),
              onFieldSubmitted: (value) {
                c.getProduct(context);
              },
            ),
          ),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 180.h,
                ),
                itemCount: c.products.length,
                itemBuilder: (context, index) => ProductWidget(
                  product: c.products[index],
                  withDeleteIcon: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
