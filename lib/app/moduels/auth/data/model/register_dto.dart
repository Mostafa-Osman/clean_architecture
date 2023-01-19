class RegisterDto {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterDto(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password});

  factory RegisterDto.fromJson(Map<String, dynamic> json) => RegisterDto(
        name: json['name'] as String,
        email: json['email'] as String,
        phone: json['phone'] as String,
        password: json['password'] as String,
      );
  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
    'password': password,
  };
}
