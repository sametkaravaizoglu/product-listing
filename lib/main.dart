import 'main_imports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp(
          enableLog: kDebugMode,
          navigatorKey: Get.key,
          getPages: [
            GetPage(
              name: RouteManager.instance.splash,
              page: () => const SplashPage(),
            ),
            GetPage(
              name: RouteManager.instance.root,
              page: () => const RootPage(),
              binding: RootBinding(),
            ),
            GetPage(
              name: RouteManager.instance.home,
              page: () => const HomePage(),
              binding: HomeBinding(),
            ),
            GetPage(
              name: RouteManager.instance.barcode,
              page: () => const BarcodePage(),
            ),
          ],
          initialRoute: RouteManager.instance.splash,
          logWriterCallback: localLogWriter,
          title: "app_name".tr,
          theme: AppThemeLight.instance.theme,
          darkTheme: AppThemeDark.instance.theme,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.cupertino,
          opaqueRoute: Get.isOpaqueRouteDefault,
          popGesture: Get.isPopGestureEnable,
          transitionDuration: Get.defaultTransitionDuration,
          locale: ApplicationConstants.instance.locale,
          translations: LocaleStrings(),
          fallbackLocale: ApplicationConstants.instance.fallbackLocale,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: ApplicationConstants.instance.supportedLocales,
        ),
      ),
    );
  }

  void localLogWriter(String text, {bool isError = false}) {
    if (kDebugMode) {
      debugPrint(text);
    }
  }
}
