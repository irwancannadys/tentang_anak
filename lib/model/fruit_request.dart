import 'dart:convert';

class FruitRequest {
  DataRequest? data;

  FruitRequest({
    required this.data,
  });

  FruitRequest.fromMap(Map<String, dynamic> json) {
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> datas = <String, dynamic>{};
    datas['data'] = data;
    return datas;
  }
}

class DataRequest {

  bool? imageReferences;
  String? referenceId;

  DataRequest({
    this.imageReferences,
    this.referenceId,
  });

  DataRequest.fromMap(Map<String, dynamic> json) {
    imageReferences = json['imageReferences'];
    referenceId = json['referenceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageReferences'] = imageReferences;
    data['referenceId'] = referenceId;
    return data;
  }
}
