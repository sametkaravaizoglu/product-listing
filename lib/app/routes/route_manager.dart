class RouteManager {
  static final RouteManager _instace = RouteManager._init();
  static RouteManager get instance {
    return _instace;
  }

  RouteManager._init();

  String get splash => "/splash";
  String get root => "/root";
  String get home => "/home";
  String get barcode => "/barcode";
}
