import 'package:flutter/material.dart';
import 'package:flutter_product_test/core/constants/app_constants.dart';
import 'package:flutter_product_test/core/init/color/color_manager.dart';
import 'package:flutter_product_test/core/init/theme/theme.dart';

class AppThemeLight extends AppTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();
  @override
  ThemeData get theme => ThemeData(
        splashFactory: NoSplash.splashFactory,
        scaffoldBackgroundColor: ColorManager.instance.white,
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
          cursorColor: ColorManager.instance.darkGray,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: ColorManager.instance.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.instance.black),
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}
