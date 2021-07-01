import 'package:gateway/controllers/relatorio/relatorio/relatorio_controller.dart';
import 'package:gateway/setup/routers/irouter.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_router/src/router.dart';

class RelatorioRouter implements IRouter {
  @override
  void configure(Router router) {
    final relatorioController = GetIt.I.get<RelatorioController>();
    router.mount('/relatorio/', relatorioController.router);
  }
}
