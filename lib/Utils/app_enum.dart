import 'package:eshop/Constant/constant.dart';

enum AppAnnimation { login, orderPlaced, registration }

extension AppAnnimationExt on AppAnnimation {
  path() {
    String base = AppUrls.animations;
    switch (this) {
      case AppAnnimation.login:
        return base + "login.json";
      case AppAnnimation.orderPlaced:
        return base + "order_placed.json";
      case AppAnnimation.registration:
        return base + "registration.json";
    }
  }
}
