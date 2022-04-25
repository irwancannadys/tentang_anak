class ResponseWrapper<T>{
  static const int errorNoNetwork = 10000;

  String? message;
  int? code;
  T? data;

  ResponseWrapper.error(
      {this.message,
        this.data,
        this.code});

  ResponseWrapper.success({
    this.message,
    this.code,
    this.data
  });
}