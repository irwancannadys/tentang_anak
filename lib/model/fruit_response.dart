// class FruitResponse {
//   Data? data;
//
//   FruitResponse();
//
//   FruitResponse.fromJson(Map<String, dynamic> json) {
//     data = json["data"] == null ? null : Data.fromJson(json["data"]);
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> map = <String, dynamic>{};
//     map["data"] = data?.toJson();
//     return map;
//   }
// }

class FruitResponse {
  ImageReferences? imagesReferences;
  List<Fruits>? fruits;

  FruitResponse();

  FruitResponse.fromJson(Map<String, dynamic> json) {
    imagesReferences = json["imagesReferences"] == null ? null : ImageReferences.fromJson(json["imagesReferences"]);
    fruits = json["fruits"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["imagesReferences"] = imagesReferences?.toJson();
    map["fruits"] = fruits;
    return map;
  }
}

class ImageReferences {
  String? apple;
  String? manggo;
  String? banana;
  String? avocado;
  String? melon;

  ImageReferences({
      this.apple, this.manggo, this.banana, this.avocado, this.melon});

  ImageReferences.fromJson(Map<String, dynamic> json) {
    apple = json["apple"];
    manggo = json["manggo"];
    banana = json["banana"];
    avocado = json["avocado"];
    melon = json["melon"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["apple"] = apple;
    data["manggo"] = manggo;
    data["banana"] = banana;
    data["avocado"] = avocado;
    data["melon"] = melon;
    return data;
  }
}

class Fruits {
  String? name;
  int? price;

  Fruits(this.name, this.price);

  Fruits.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["price"] = price;
    return data;
  }
}