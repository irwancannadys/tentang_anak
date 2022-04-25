import 'package:dio/dio.dart';
import 'package:tentang_anak/common/constant.dart';
import 'package:tentang_anak/common/response_wrapper.dart';
import 'package:tentang_anak/dio/dio_client.dart';
import 'package:tentang_anak/model/fruit_request.dart';
import 'package:tentang_anak/model/fruit_response.dart';

class ApiService {
  final DioClient dioClient;

  ApiService(this.dioClient);

  Future<ResponseWrapper<FruitResponse>> getListFruit(
      FruitRequest fruitRequest) async {
    try {
      final response = await dioClient.dio
          .post(Constant.FRUIT_LIST_END_POINT, data: fruitRequest.toJson());
      return ResponseWrapper.success(
          data: FruitResponse.fromJson(response.data));
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        return ResponseWrapper.error(
          message: e.message,
          code: ResponseWrapper.errorNoNetwork,
        );
      }
      return ResponseWrapper.error(
          message: e.message, code: e.response?.statusCode);
    } catch (e) {
      return ResponseWrapper.error(message: e.toString(), code: 403);
    }
  }
}
