class RegisterResponseModel {
  RegisterResponseModel({
    required this.type,
    required this.title,
    required this.status,
    required this.detail,
    required this.instance,
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });
  late final String type;
  late final String title;
  late final int status;
  late final String detail;
  late final String instance;
  late final String additionalProp1;
  late final String additionalProp2;
  late final String additionalProp3;

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    detail = json['detail'];
    instance = json['instance'];
    additionalProp1 = json['additionalProp1'];
    additionalProp2 = json['additionalProp2'];
    additionalProp3 = json['additionalProp3'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['title'] = title;
    data['status'] = status;
    data['detail'] = detail;
    data['instance'] = instance;
    data['additionalProp1'] = additionalProp1;
    data['additionalProp2'] = additionalProp2;
    data['additionalProp3'] = additionalProp3;
    return data;
  }
}
