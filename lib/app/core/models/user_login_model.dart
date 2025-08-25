import 'dart:convert';

class UserLoginModel {
  final String email;
  final String displayName;
  final bool firstLogin;
  final String token;
  final int userId;
  final int pessoaId;

  UserLoginModel({
    required this.email,
    required this.displayName,
    required this.firstLogin,
    required this.token,
    required this.userId,
    required this.pessoaId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': email,
      'displayName': displayName,
      'firstLogin': firstLogin,
      'token': token,
      'userId': userId,
      'pessoaId': pessoaId,
    };
  }

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      email: map['username'] ?? "",
      displayName: map['displayName'] ?? "",
      firstLogin: map['firstLogin'] ?? "",
      token: map['token'] ?? "",
      userId: map['userId'] ?? "",
      pessoaId: map['pessoaId'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLoginModel.fromJson(String source) =>
      UserLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
