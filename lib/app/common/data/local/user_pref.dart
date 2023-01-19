import 'dart:convert';
import 'dart:developer';

import 'package:clean_architecture/app/common/data/local/pref.dart';

import '../../../moduels/auth/data/model/user_info.dart';
import '../../constants/string.dart';


class UserPrefs {
  final prefs = SharedPrefs.instance;

  Future<void> setUserData(User user) async {
    await prefs.setString(sharedUserData, jsonEncode(user.toMap()));
  }

  User? getUserData() {
    final userMap = prefs.getString(sharedUserData);
    log('mostafa $userMap');

    return userMap != null
        ? User.fromMap(jsonDecode(userMap) as Map<String, dynamic>)
        : null;
  }

  Future<void> deleteUserData() async => prefs.remove(sharedUserData);

  Future<void> setUserToken(String token) =>
      prefs.setString(sharedTokenId, token);

  String getUserToken() => prefs.getString(sharedTokenId) ?? '';

  Future<void> deleteUserToken() async => prefs.remove(sharedTokenId);

  bool get isUserLoggedIn => prefs.getString('token') != null;
}
