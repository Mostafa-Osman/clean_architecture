class AuthValidationRepo {
  String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'empty_field';
    } else if (phone.length != 11 || !isEgyPhone(phone)) {
      return 'invalid_phone';
    } else {
      return null;
    }
  }

  bool isEgyPhone(String phone) {
    return phone.startsWith('010') ||
        phone.startsWith('011') ||
        phone.startsWith('012') ||
        phone.startsWith('015');
  }

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) return 'empty_field';
    final regularName = RegExp(
      r"^\s*([A-Za-z\u0621-\u064A]{1,}([\.,] |[-']| ))+[A-Za-z\u0621-\u064A0]+\.?\s*$",
    );
    if (!regularName.hasMatch(value)) return 'invalid_name_message';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'empty_field';
    final regularEmail =
        RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
    if (!regularEmail.hasMatch(value)) return 'invalid_email_message';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'empty_field';
    if (value.length < 8) return 'invalid_password';
    return null;
  }

  String? validateRePassword(String? password, String? rePassword) {
    if (rePassword == null || rePassword.isEmpty) return 'empty_field';
    return password != rePassword ? 'password_dont_match' : null;
  }

  String? checkIfEmpty(String? value) =>
      value == null || value.isEmpty ? 'empty_field' : null;
}
