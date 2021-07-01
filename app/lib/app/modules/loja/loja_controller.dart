import 'package:app/app/models/veiculo_item_model.dart';
import 'package:app/app/models/venda_model.dart';
import 'package:app/repositories/loja_repository.dart';
import 'package:get/get.dart';

class LojaController extends GetxController {
  final LojaRepository _repository;
  final veiculos_disponiveis = <VeiculoItemModel>[].obs;
  final veiculos_vendidos = <VeiculoItemModel>[].obs;
  final _loading = false.obs;

  LojaController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    await obterTodosVeiculos();
  }

  Future<void> realizarVenda(String veiculo_id, double venda_valor) async {
    _loading(true);

    try {
      await _repository.realizarVenda(VendaModel(veiculo_id, venda_valor));
    } catch (e) {}

    await obterTodosVeiculos();

    _loading(false);
  }

  Future<void> obterTodosVeiculos() async {
    final veiculos_data = await _repository.obterTodos();
    veiculos_disponiveis.assignAll(veiculos_data.where((e) => !e.vendido));
    veiculos_vendidos.assignAll(veiculos_data.where((e) => e.vendido));
  }
}
