import 'package:flutter/cupertino.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CupertinoSlidingSegmentedItem extends StatelessWidget {
  const CupertinoSlidingSegmentedItem({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: isActive
              ? TextStyle(
                  color: ColorManager.instance.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.12,
                )
              : TextStyle(
                  color: ColorManager
                      .instance.cupertinoSlidingSegmentedControlActive,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.12,
                ),
        ),
      ),
    );
  }
}
