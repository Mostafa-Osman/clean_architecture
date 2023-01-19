import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../../../common/constants/string.dart';
import '../../../../common/data/local/lang_pref.dart';
import '../../../../services/locator_service.dart';
import '../model/register_dto.dart';

class AuthWebservice {
  Future<Map<String, dynamic>> register(RegisterDto registerModel) async {
    const url = '${AppStrings.baseUrl}register';
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Content-language': gt<LangPrefs>().lang,
    };
    final body = registerModel.toJson();
    log(body.toString());
    final response = await post(
      Uri.parse(url),
      headers: headers,
      body: const Utf8Encoder().convert(jsonEncode(body)),
    );
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    if (data['statusCode'] != 200) throw data['message'];
    return data['data'] as Map<String, dynamic>;
  }
}
