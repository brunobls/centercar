import 'package:catalago/application/view_models/cadastrar_veiculo_view_modal.dart';
import 'package:catalago/application/view_models/veiculo_modelo_view_model.dart';
import 'package:catalago/application/view_models/veiculo_view_model.dart';

abstract class IVeiculoService {
  Future<List<VeiculoViewModel>> obterTodosVeiculos();
  Future<List<VeiculoModeloViewModel>> obterTodosModelos();
  Future<void> cadastrarVeiculo(CadastrarVeiculoViewModal veiculo);
  Future<void> debitarEstoqueModeloPorVeiculo(String id, int quantidade);
}
