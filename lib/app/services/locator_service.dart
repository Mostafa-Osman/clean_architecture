import 'package:get_it/get_it.dart';

import '../moduels/auth/data/repo/validation_repository.dart';

final gt = GetIt.instance.get;

class GetItLocator {
  GetItLocator._();

  static void init() {
    final singleton = GetIt.instance.registerLazySingleton;

    singleton<AuthValidationRepo>(() => AuthValidationRepo());
  }
}
