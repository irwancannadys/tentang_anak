import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class FruitResponse {
  FruitResponse({
    this.data,
  });

  factory FruitResponse.fromJson(Map<String, dynamic> json) => FruitResponse(
        data: json['data'] == null
            ? null
            : Data.fromJson(asT<Map<String, dynamic>>(json['data'])!),
      );

  Data? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class Data {
  Data({
    this.imagesreferences,
    this.fruits,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final List<Fruits>? fruits = json['fruits'] is List ? <Fruits>[] : null;
    if (fruits != null) {
      for (final dynamic item in json['fruits']!) {
        if (item != null) {
          fruits.add(Fruits.fromJson(asT<Map<String, dynamic>>(item)!));
        }
      }
    }
    return Data(
      imagesreferences: json['imagesReferences'] == null
          ? null
          : Imagesreferences.fromJson(
              asT<Map<String, dynamic>>(json['imagesReferences'])!),
      fruits: fruits,
    );
  }

  Imagesreferences? imagesreferences;
  List<Fruits>? fruits;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'imagesReferences': imagesreferences,
        'fruits': fruits,
      };
}

class Imagesreferences {
  Imagesreferences({
    this.apple,
    this.manggo,
    this.banana,
    this.avocado,
    this.melon,
  });

  factory Imagesreferences.fromJson(Map<String, dynamic> json) =>
      Imagesreferences(
        apple: asT<String?>(json['apple']),
        manggo: asT<String?>(json['manggo']),
        banana: asT<String?>(json['banana']),
        avocado: asT<String?>(json['avocado']),
        melon: asT<String?>(json['melon']),
      );

  String? apple;
  String? manggo;
  String? banana;
  String? avocado;
  String? melon;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'apple': apple,
        'manggo': manggo,
        'banana': banana,
        'avocado': avocado,
        'melon': melon,
      };
}

class Fruits {
  Fruits({
    this.name,
    this.price,
  });

  factory Fruits.fromJson(Map<String, dynamic> json) => Fruits(
        name: asT<String?>(json['name']),
        price: asT<int?>(json['price']),
      );

  String? name;
  int? price;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'price': price,
      };
}
