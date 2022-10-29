class RegisterRequestModel {
  RegisterRequestModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.otherNames,
    required this.phoneNumber,
    required this.confirmedPassword,
  });
  late final String email;
  late final String password;
  late final String firstName;
  late final String lastName;
  late final String otherNames;
  late final String phoneNumber;
  late final String confirmedPassword;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    otherNames = json['otherNames'];
    phoneNumber = json['phoneNumber'];
    confirmedPassword = json['confirmedPassword'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['otherNames'] = otherNames;
    data['phoneNumber'] = phoneNumber;
    data['confirmedPassword'] = confirmedPassword;
    return data;
  }
}
