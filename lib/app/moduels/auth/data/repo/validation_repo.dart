class AuthValidationRepo {
  String? validatePhoneNumber(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'empty field';
    } else if (phone.length != 11 || !isEgyPhone(phone)) {
      return 'invalid phone';
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
    if (value == null || value.isEmpty) return 'empty field';
    final regularName = RegExp(
      r"^\s*([A-Za-z\u0621-\u064A]{1,}([\.,] |[-']| ))+[A-Za-z\u0621-\u064A0]+\.?\s*$",
    );
    if (!regularName.hasMatch(value)) return 'invalid name ';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'empty field';
    final regularEmail =
        RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
    if (!regularEmail.hasMatch(value)) return 'invalid email';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'empty field';
    if (value.length < 8) return 'invalid password';
    return null;
  }

  String? validateRePassword(String? password, String? rePassword) {
    if (rePassword == null || rePassword.isEmpty) return 'empty field';
    return password != rePassword ? 'password don\'t match' : null;
  }

  String? checkIfEmpty(String? value) =>
      value == null || value.isEmpty ? 'empty field' : null;
}
