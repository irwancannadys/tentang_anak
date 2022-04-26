import 'package:flutter/material.dart';
import 'package:tentang_anak/model/fruit_request.dart';
import 'package:tentang_anak/model/fruit_response.dart';
import 'package:tentang_anak/repository/repository.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required this.repository});

  final Repository repository;

  bool isLoding = true;
  String name = "";
  FruitResponse fruitResponse = FruitResponse();
  List<Fruits> list = [];

  Future<void> getListFruits() async {
    final request = FruitRequest(
      data: DataRequest(imageReferences: true, referenceId: "1650165235"),
    );

    final response = await repository.listFruits(request);
    print("response nya: ${response.data}");
    fruitResponse = response.data!;
    name = response.data?.data?.imagesreferences?.avocado ?? "";
    list = response.data?.data?.fruits ?? [];
    notifyListeners();
  }
}
