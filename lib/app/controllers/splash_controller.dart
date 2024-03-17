import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_product_test/main_imports.dart';

class SplashController extends GetxController {
  bool opacity = true;
  final Duration duration = const Duration(milliseconds: 500);
  final Duration pageRouteDuration = const Duration(milliseconds: 1500);

  late Timer _timer;

  SplashController();
  @override
  void onInit() {
    startLogoOpacityAnimation();
    routeHandler();
    listenInternetConnection();
    super.onInit();
  }

  @override
  void dispose() {
    endLogoOpacityAnimation();
    super.dispose();
  }

  startLogoOpacityAnimation() {
    _timer = Timer.periodic(
      duration,
      (timer) {
        opacity = !opacity;
        update();
      },
    );
  }

  endLogoOpacityAnimation() {
    _timer.cancel();
  }

  routeHandler() {
    Future.delayed(
      pageRouteDuration,
      () {
        Get.offAllNamed(RouteManager.instance.root);
      },
    );
  }

  listenInternetConnection() {
    SnackBar? snackBar;
    Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.wifi) {
          snackBar = SnackBar(
            content: Text("connected_wifi".tr),
          );
        } else if (result == ConnectivityResult.mobile) {
          snackBar = SnackBar(
            content: Text("connected_mobile".tr),
          );
        } else {
          snackBar = SnackBar(
            content: Text("connection_lost".tr),
          );
        }
        if (snackBar != null) {
          ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar!);
        }
      },
    );
  }
}
