import 'package:clean_architecture/app/common/data/local/pref.dart';

enum Lang { ar, en }

class LangPrefs {
  final prefs = SharedPrefs.instance;
  final isKeyArabic = 'lang';

  String get lang => isArabic ? 'ar' : 'en';

  bool get isArabic => prefs.getBool(isKeyArabic) ?? true;

  Future<void> setLangToArabic() => prefs.setBool(isKeyArabic, true);

  Future<void> setLangToEnglish() => prefs.setBool(isKeyArabic, false);

  Future<void> setLang(Lang lang) =>
      prefs.setBool(isKeyArabic, lang == Lang.ar);

  Lang get enumLang => isArabic ? Lang.ar : Lang.en;
}
