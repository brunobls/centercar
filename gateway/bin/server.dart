import 'dart:io';
import 'package:args/args.dart';
import 'package:gateway/setup/middlewares/content_type/content_type_middleware.dart';
import 'package:gateway/setup/middlewares/cors/cors_middleware.dart';
import 'package:gateway/setup/startup.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

const _hostname = '0.0.0.0';

void main(List<String> args) async {
  var parser = ArgParser()..addOption('port', abbr: 'p');
  var result = parser.parse(args);

  var portStr = result['port'] ?? Platform.environment['PORT'] ?? '8080';
  var port = int.tryParse(portStr);

  if (port == null) {
    stdout.writeln('Could not parse port value "$portStr" into a number.');
    exitCode = 64;
    return;
  }

  final router = Router();

  final startup = Startup(type: Env.dev);
  startup.configureServices();
  startup.configureRouter(router);

  var handler = const shelf.Pipeline()
      .addMiddleware(CorsMiddleware().handler)
      .addMiddleware(
          ContentTypeMiddleware('application/json;charset=utf-8').handler)
      .addMiddleware(shelf.logRequests())
      .addHandler(router);

  var server = await io.serve(handler, _hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
