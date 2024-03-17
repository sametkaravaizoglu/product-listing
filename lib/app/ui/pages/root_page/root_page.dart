import 'package:flutter/material.dart';
import 'package:flutter_product_test/app/ui/pages/root_page/widgets/sliding_section_widget.dart';
import 'package:flutter_product_test/app/ui/utils/assets_manager.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controllers/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(1.00, 0.01),
          end: const Alignment(-1, -0.01),
          colors: ColorManager.instance.homeGradient,
        ),
      ),
      child: GetBuilder<RootController>(
          init: RootController(),
          builder: (c) {
            return SafeArea(
              bottom: false,
              top: false,
              child: Scaffold(
                backgroundColor: ColorManager.instance.transparent,
                appBar: AppBar(
                  backgroundColor: ColorManager.instance.transparent,
                  title: Text(
                    "app_name".tr,
                    style: TextStyle(
                      color: ColorManager.instance.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  actions: [
                    if (c.cupertinoSlidingSegmentedIndex == 0)
                      IconButton(
                        onPressed: () {
                          c.changeCupertinoSlidingSegmentedIndex(1);
                          c.changePageControllerIndex(1);
                        },
                        icon: SvgPicture.asset(
                          AssetsManager.instance.search,
                        ),
                      ),
                  ],
                ),
                body: Container(
                  height: Get.height,
                  width: Get.width,
                  decoration: ShapeDecoration(
                    color: ColorManager.instance.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: ColorManager.instance.black,
                        blurRadius: 1.2,
                        offset: const Offset(0, 0),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      const SlidingSectionWidget(),
                      Expanded(
                        child: PageView.builder(
                          controller: c.pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => c.pages[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
