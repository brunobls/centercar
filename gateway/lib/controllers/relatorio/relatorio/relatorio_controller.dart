import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'package:relatorio/business/irelatorio_service.dart';

part 'relatorio_controller.g.dart';

class RelatorioController {
  late IRelatorioService _relatorioService;

  RelatorioController({
    required relatorioService,
  }) {
    _relatorioService = relatorioService;
  }

  @Route.get('/')
  Future<Response> obterRelatorio(Request request) async {
    try {
      final indicadores = await _relatorioService.obterIndicadores();
      return Response.ok(indicadores.toJson());
    } catch (e) {
      return Response.internalServerError(
        body: jsonEncode(
          {'message': 'Erro ao obter o relatório'},
        ),
      );
    }
  }

  Router get router => _$RelatorioControllerRouter(this);
}
