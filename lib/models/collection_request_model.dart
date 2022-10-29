class CollectionRequest {
  CollectionRequest({
    required this.dateToBeCollected,
    required this.numberOfBins,
    required this.userId,
    required this.localityId,
  });
  late final String dateToBeCollected;
  late final int numberOfBins;
  late final String userId;
  late final int localityId;

  CollectionRequest.fromJson(Map<String, dynamic> json) {
    dateToBeCollected = json['dateToBeCollected'];
    numberOfBins = json['numberOfBins'];
    userId = json['userId'];
    localityId = json['localityId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dateToBeCollected'] = dateToBeCollected;
    _data['numberOfBins'] = numberOfBins;
    _data['userId'] = userId;
    _data['localityId'] = 1;
    return _data;
  }
}
