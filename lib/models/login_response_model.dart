import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  LoginResponseModel({
    required this.userId,
    required this.token,
    required this.refreshToken,
  });
  late final String userId;
  late final String token;
  late final String refreshToken;

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    // ignore: no_leading_underscores_for_local_identifiers
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['token'] = token;
    _data['refreshToken'] = refreshToken;
    return _data;
  }
}
