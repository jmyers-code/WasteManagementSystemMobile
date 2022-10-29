class GetCollectionResponseData {
  int? id;
  String? dateToBeCollected;
  int? numberOfBins;
  String? userId;
  int? localityId;

  GetCollectionResponseData(
      {this.id,
      this.dateToBeCollected,
      this.numberOfBins,
      this.userId,
      this.localityId});

  GetCollectionResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateToBeCollected = json['dateToBeCollected'];
    numberOfBins = json['numberOfBins'];
    userId = json['userId'];
    localityId = json['localityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateToBeCollected'] = this.dateToBeCollected;
    data['numberOfBins'] = this.numberOfBins;
    data['userId'] = this.userId;
    data['localityId'] = this.localityId;
    return data;
  }
}
