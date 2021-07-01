import 'package:get/get.dart';

class RestClient extends GetConnect {
  final String _url = 'http://192.168.15.3:8080';

  RestClient() {
    httpClient.baseUrl = _url;
  }
}

class RestClientException implements Exception {
  final String message;

  RestClientException(this.message);

  @override
  String toString() => 'RestClientException(message: $message)';
}
