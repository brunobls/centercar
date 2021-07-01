import 'package:shelf_router/src/router.dart';
import 'package:dotenv/dotenv.dart' show load, env;

import 'package:gateway/setup/routers/router_setup.dart';
import 'package:gateway/setup/services/service_locator_config.dart';

class Startup {
  Startup({required Env type}) {
    // load('.env-' + type.toString().split('.')[1]);
  }

  void configureServices() {
    configureServiceLocatorGateway();
  }

  void configureRouter(Router router) => RouterSetup(router).configure();
}

enum Env { dev, hom, prod }
