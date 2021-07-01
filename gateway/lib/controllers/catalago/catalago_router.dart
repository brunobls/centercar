import 'package:gateway/setup/routers/irouter.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

import 'catalago_controller.dart';

class CatalagoRouter implements IRouter {
  @override
  void configure(Router router) {
    final catalagoController = GetIt.I.get<CatalagoController>();
    router.mount('/catalago/', catalagoController.router);
  }
}
