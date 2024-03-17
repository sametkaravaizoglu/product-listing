import 'package:flutter/cupertino.dart';
import 'package:flutter_product_test/app/controllers/root_controller.dart';
import 'package:flutter_product_test/app/ui/pages/root_page/widgets/cupertino_sliding_segmented_item.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SlidingSectionWidget extends StatelessWidget {
  const SlidingSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.w),
      child: SizedBox(
        width: double.infinity,
        child: GetBuilder<RootController>(
          builder: (c) {
            return CupertinoSlidingSegmentedControl<int>(
              backgroundColor: ColorManager
                  .instance.cupertinoSlidingSegmentedControlBackground,
              thumbColor:
                  ColorManager.instance.cupertinoSlidingSegmentedControlActive,
              groupValue: c.cupertinoSlidingSegmentedIndex,
              padding: EdgeInsets.all(4.w),
              children: {
                0: CupertinoSlidingSegmentedItem(
                  title: "home_page".tr,
                  isActive: c.cupertinoSlidingSegmentedIndex == 0,
                ),
                1: CupertinoSlidingSegmentedItem(
                  title: "barcode_page".tr,
                  isActive: c.cupertinoSlidingSegmentedIndex == 1,
                ),
              },
              onValueChanged: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
                c.changeCupertinoSlidingSegmentedIndex(value);
                c.changePageControllerIndex(value ?? 0);
              },
            );
          },
        ),
      ),
    );
  }
}
