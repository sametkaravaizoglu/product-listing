import 'package:flutter_product_test/app/ui/pages/home_page/widgets/product_widget.dart';
import 'package:flutter_product_test/main_imports.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: GetBuilder<HomeController>(
          init: HomeController(context: context),
          autoRemove: false,
          builder: (c) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: GridView.builder(
                controller: c.scrollController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 180.h,
                ),
                itemCount: c.productsModel?.products?.length ?? 0,
                itemBuilder: (context, index) => ProductWidget(
                  product: c.productsModel?.products?[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
