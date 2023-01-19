import 'package:clean_architecture/app/common/data/local/lang_pref.dart';
import 'package:get_it/get_it.dart';

import '../common/data/local/user_pref.dart';
import '../moduels/auth/data/data_source/auth_webservice.dart';
import '../moduels/auth/data/repo/auth_repositore.dart';
import '../moduels/auth/data/repo/validation_repo.dart';

final gt = GetIt.instance.get;

class GetItLocator {
  GetItLocator._();

  static void init() {
    final singleton = GetIt.instance.registerLazySingleton;
    singleton<UserPrefs>(() => UserPrefs());
    singleton<LangPrefs>(() => LangPrefs());
    singleton<AuthValidationRepo>(() => AuthValidationRepo());
    singleton<AuthWebservice>(() => AuthWebservice());
    singleton<AuthRepo>(() => AuthRepo());

  }
}
