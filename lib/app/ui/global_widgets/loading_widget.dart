import 'package:flutter/cupertino.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 32.h,
        width: 32.h,
        decoration: BoxDecoration(
          color: ColorManager.instance.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorManager.instance.gray.withOpacity(0.5),
            width: 0.5,
          ),
        ),
        child: CupertinoActivityIndicator(
          color: ColorManager.instance.primary,
        ),
      ),
    );
  }
}
