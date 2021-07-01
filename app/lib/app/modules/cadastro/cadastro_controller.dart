import 'package:app/app/models/modelos_item_model.dart';
import 'package:app/app/models/veiculo_cadastro_model.dart';
import 'package:app/app/modules/loja/loja_page.dart';
import 'package:app/repositories/cadastro_repository.dart';
import 'package:get/get.dart';

class CadastroController extends GetxController {
  final CadastroRepository _repository;
  final veiculo_modelos = <ModelosItemModel>[].obs;
  var veiculo_modelos_selected = ''.obs;

  CadastroController(this._repository);

  @override
  Future<void> onInit() async {
    super.onInit();
    final veiculo_modelos_data = await _repository.obterTodosModelos();
    veiculo_modelos_selected.value = veiculo_modelos_data[0].id;
    veiculo_modelos.assignAll(veiculo_modelos_data);
  }

  Future<void> cadastrarVeiculo(
    String placa,
    String chassi,
    double valor,
  ) async {
    final veiculo_cadastro_model = VeiculoCadastroModel(
      modelo_id: veiculo_modelos_selected.value,
      placa: placa,
      chassi: chassi,
      valor: valor,
    );

    try {
      await _repository.cadastrarVeiculos(veiculo_cadastro_model);
      Get.offNamed(LojaPage.ROUTE_PAGE);
    } catch (e) {}
  }
}
