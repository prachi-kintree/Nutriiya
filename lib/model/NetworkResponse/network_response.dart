class NetworkResponse {
  Map<String, dynamic>? data;
  String? message;
  NetworkResponseType? type;

  NetworkResponse.success({this.data}) : type = NetworkResponseType.success;
  NetworkResponse.error({this.message}) : type = NetworkResponseType.error;
  NetworkResponse.loading({this.message}) : type = NetworkResponseType.loading;
}

enum NetworkResponseType {
  success,
  error,
  loading,
}
