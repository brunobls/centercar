import 'package:app/app/models/relatorio_model.dart';
import 'package:app/repositories/relatorio_repository.dart';
import 'package:get/get.dart';

class RelatorioController extends GetxController {
  final RelatorioRepository _repository;
  final valor_em_compras = 0.0.obs;
  final valor_em_vendas = 0.0.obs;
  final lucro_prejuizo = 0.0.obs;
  final pago_em_comissao = 0.0.obs;

  RelatorioController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    await atualizarDadosDoRelatorio();
  }

  Future<void> atualizarDadosDoRelatorio() async {
    try {
      final RelatorioModel relatorio_model = await _repository.obterRelatorio();
      valor_em_compras.value = relatorio_model.valor_total_em_compras;
      valor_em_vendas.value = relatorio_model.valor_total_em_vendas;
      lucro_prejuizo.value = relatorio_model.lucro_ou_prejuizo;
      pago_em_comissao.value = relatorio_model.valor_pago_em_comissao;
    } catch (e) {}
  }
}
