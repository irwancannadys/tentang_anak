import 'package:tentang_anak/model/fruit_request.dart';
import 'package:tentang_anak/model/fruit_response.dart';

import '../common/response_wrapper.dart';
import '../network/api_service.dart';

class Repository {
  final ApiService remoteDataSource;

  Repository(this.remoteDataSource);

  Future<ResponseWrapper<FruitResponse>> listFruits(FruitRequest fruitRequest) async {
    return await remoteDataSource.getListFruit(fruitRequest);
  }
}