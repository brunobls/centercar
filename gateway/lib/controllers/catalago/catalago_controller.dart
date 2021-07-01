import 'dart:convert';
import 'package:catalago/application/services/iveiculo_service.dart';
import 'package:catalago/application/view_models/cadastrar_veiculo_view_modal.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'catalago_controller.g.dart';

@Injectable()
class CatalagoController {
  late IVeiculoService _veiculoService;

  CatalagoController({required veiculoService}) {
    _veiculoService = veiculoService;
  }

  @Route.get('/')
  Future<Response> obterTodosVeiculos(Request request) async {
    try {
      final veiculos = await _veiculoService.obterTodosVeiculos();

      return Response.ok(jsonEncode(veiculos.map((e) => e.toMap()).toList()));
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao obter todos os veículos'},
        ),
      );
    }
  }

  @Route.post('/')
  Future<Response> cadastrarVeiculo(Request request) async {
    try {
      final source = await request.readAsString();

      final veiculo = CadastrarVeiculoViewModal.fromJson(source);

      await _veiculoService.cadastrarVeiculo(veiculo);

      return Response.ok('Veículo cadastrado com sucesso');
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao cadastrar veículo'},
        ),
      );
    }
  }

  @Route.get('/modelos')
  Future<Response> obterTodosModelos(Request request) async {
    try {
      final veiculos_modelos = await _veiculoService.obterTodosModelos();

      return Response.ok(
          jsonEncode(veiculos_modelos.map((e) => e.toMap()).toList()));
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao obter todos os modelos'},
        ),
      );
    }
  }

  Router get router => _$CatalagoControllerRouter(this);
}
