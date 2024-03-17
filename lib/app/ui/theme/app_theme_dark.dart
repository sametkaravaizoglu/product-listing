import 'package:flutter/material.dart';
import 'package:flutter_product_test/core/constants/app_constants.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_product_test/core/init/theme/theme.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();
    return _instance!;
  }

  AppThemeDark._init();

  @override
  ThemeData get theme => ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: ColorManager.instance.black,
        highlightColor: ColorManager.instance.transparent,
        focusColor: ColorManager.instance.transparent,
        hoverColor: ColorManager.instance.transparent,
        splashColor: ColorManager.instance.transparent,
        shadowColor: ColorManager.instance.transparent,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: ColorManager.instance.transparent,
        ),
        fontFamily: ApplicationConstants.instance.fontFamily,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.instance.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.black,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.instance.white),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
