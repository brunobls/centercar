import 'dart:io';

import 'package:gateway/setup/middlewares/middlewares.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf/src/request.dart';

class CorsMiddleware extends Middlewares {
  final Map<String, String> headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
    'Access-Control-Allow-Headers': '*',
  };

  @override
  Future<Response> execute(Request request) async {
    if (request.method == 'OPTIONS') {
      return Response(HttpStatus.ok, headers: headers);
    }

    final response = await innerHandler(request);

    return response.change(headers: headers);
  }
}
