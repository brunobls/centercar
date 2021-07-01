import 'package:gateway/controllers/catalago/catalago_router.dart';
import 'package:gateway/controllers/relatorio/relatorio/relatorio_router.dart';
import 'package:gateway/controllers/venda/venda_router.dart';
import 'package:gateway/setup/routers/irouter.dart';
import 'package:shelf_router/shelf_router.dart';

class RouterSetup {
  final Router _router;
  final List<IRouter> _routers = [
    CatalagoRouter(),
    VendaRouter(),
    RelatorioRouter()
  ];

  RouterSetup(this._router);

  void configure() => _routers.forEach((e) => e.configure(_router));
}
