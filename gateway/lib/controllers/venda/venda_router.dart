import 'package:gateway/setup/routers/irouter.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

import 'venda_controller.dart';

class VendaRouter implements IRouter {
  @override
  void configure(Router router) {
    final vendaController = GetIt.I.get<VendaController>();
    router.mount('/venda/', vendaController.router);
  }
}
