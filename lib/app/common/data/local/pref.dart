import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();

  static late final SharedPreferences instance;

  static Future<void> init() async =>
      instance = await SharedPreferences.getInstance();
}
