class AssetsManager {
  static AssetsManager? _instance;
  static AssetsManager get instance {
    _instance ??= AssetsManager._init();
    return _instance!;
  }

  AssetsManager._init();

  String get logo => "assets/svg/beymen-logo-dot-blue.svg";
  String get search => "assets/svg/search.svg";
}
