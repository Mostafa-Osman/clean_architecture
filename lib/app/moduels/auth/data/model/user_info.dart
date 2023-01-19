class User {
  int userId;
  String name;
  String phone;
  String email;
  final String token;

  User(
      {required this.userId,
      required this.name,
      required this.phone,
      required this.email,
      required this.token});

  Map<String, dynamic> toMap() {
    return {
      'id': userId,
      'name': name,
      'phone': phone,
      'email': email,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: (map['id'] as int),
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      token: map['token'] as String,
    );
  }
}
