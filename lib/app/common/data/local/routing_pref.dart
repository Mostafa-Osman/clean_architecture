import 'package:clean_architecture/app/common/data/local/pref.dart';

import '../../../router/router_name.dart';

class RoutingPrefs {
  RoutingPrefs._();

  static void setOnBoardingSeen() => SharedPrefs.instance.setBool('seen', true);

  static bool get isOnBoardingSeen =>
      SharedPrefs.instance.getBool('seen') ?? false;

  static String get initialRoute => isOnBoardingSeen == true
      ?  RouteNames.onBoarding//RouteNames.bottomNavBar
      : RouteNames.onBoarding;
}
