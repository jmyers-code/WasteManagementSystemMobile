class CollectionRespomse {
  CollectionRespomse({
    required this.status,
    required this.message,
    required this.dataenum,
  });
  late final int status;
  late final String message;
  late final int dataenum;

  CollectionRespomse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    dataenum = json['dataenum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['dataenum'] = dataenum;
    return _data;
  }
}
