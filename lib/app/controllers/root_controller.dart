import 'package:flutter_product_test/main_imports.dart';

class RootController extends GetxController {
  int? cupertinoSlidingSegmentedIndex = 0;
  PageController pageController = PageController();

  changeCupertinoSlidingSegmentedIndex(int? value) {
    if (value == cupertinoSlidingSegmentedIndex) {
      return;
    }

    if (value == null) {
      return;
    }

    cupertinoSlidingSegmentedIndex = value;
    update();
  }

  changePageControllerIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  final List<Widget> pages = const [
    HomePage(),
    BarcodePage(),
  ];
}
