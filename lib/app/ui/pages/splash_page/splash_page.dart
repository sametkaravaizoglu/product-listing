import 'package:flutter/material.dart';
import 'package:flutter_product_test/app/ui/utils/assets_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GetBuilder<SplashController>(
            init: SplashController(),
            builder: (controller) {
              return AnimatedOpacity(
                opacity: controller.opacity ? 1 : 0,
                duration: controller.duration,
                child: SvgPicture.asset(AssetsManager.instance.logo),
              );
            },
          ),
        ),
      ),
    );
  }
}
