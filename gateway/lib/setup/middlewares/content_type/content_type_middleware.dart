import 'package:gateway/setup/middlewares/middlewares.dart';
import 'package:shelf/src/response.dart';
import 'package:shelf/src/request.dart';

class ContentTypeMiddleware extends Middlewares {
  final String _contentType;

  ContentTypeMiddleware(this._contentType);

  @override
  Future<Response> execute(Request request) async {
    final response = await innerHandler(request);
    return response.change(headers: {'content-type': _contentType});
  }
}
