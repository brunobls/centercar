import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:injectable/injectable.dart';
import 'package:venda/application/services/ivenda_service.dart';
import 'package:venda/application/view_models/venda_view_modal.dart';

part 'venda_controller.g.dart';

@Injectable()
class VendaController {
  late IVendaService _vendaService;

  VendaController({
    required vendaService,
  }) {
    _vendaService = vendaService;
  }

  @Route.post('/')
  Future<Response> cadastrarVenda(Request request) async {
    try {
      final source = await request.readAsString();

      final venda = VendaViewModal.fromJson(source);

      await _vendaService.realizarVenda(venda);

      return Response.ok('Venda cadastrada com sucesso');
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao cadastrar venda'},
        ),
      );
    }
  }

  Router get router => _$VendaControllerRouter(this);
}
