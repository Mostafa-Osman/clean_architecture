import '../../../../common/data/local/user_pref.dart';
import '../../../../services/locator_service.dart';
import '../data_source/auth_webservice.dart';
import '../model/register_dto.dart';

class AuthRepo {
  final webservice = gt<AuthWebservice>();
  final userPrefs = gt<UserPrefs>();

  Future<void> register(RegisterDto registerModel) async {
    final registerData = await webservice.register(registerModel);
    final user = registerData['data'] as Map<String, dynamic>;
    final token = user['token'] as String;
    await userPrefs.setUserToken(token);
  }
}
