import 'package:catalago/application/view_models/cadastrar_veiculo_view_modal.dart';
import 'package:catalago/application/view_models/veiculo_modelo_view_model.dart';
import 'package:catalago/application/view_models/veiculo_view_model.dart';
import 'package:catalago/domain/iveiculo_repository.dart';
import 'package:catalago/domain/veiculo.dart';
import 'package:injectable/injectable.dart';

import 'iveiculo_service.dart';

@LazySingleton(as: IVeiculoService)
class VeiculoService implements IVeiculoService {
  final IVeiculoRepository veiculoRepository;

  VeiculoService({
    required this.veiculoRepository,
  });

  @override
  Future<List<VeiculoViewModel>> obterTodosVeiculos() async {
    try {
      final veiculos = await veiculoRepository.obterTodos();

      List<VeiculoViewModel> veiculos_view_model = [];
      if (veiculos.isNotEmpty) {
        veiculos.forEach((e) {
          veiculos_view_model.add(VeiculoViewModel(
              ano: e.modelo.ano,
              chassi: e.chassi,
              cor: e.modelo.cor,
              data_compra: e.data_compra,
              id: e.id,
              marca: e.modelo.marca,
              modelo: e.modelo.nome,
              placa: e.placa,
              valor: e.valor,
              vendido: e.vendido));
        });
      }

      return veiculos_view_model;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<List<VeiculoModeloViewModel>> obterTodosModelos() async {
    try {
      final veiculos_modelos = await veiculoRepository.obterTodosModelos();

      List<VeiculoModeloViewModel> veiculos_modelos_view_model = [];
      if (veiculos_modelos.isNotEmpty) {
        veiculos_modelos.forEach((e) {
          veiculos_modelos_view_model.add(VeiculoModeloViewModel(
              id: e.id, nome: e.nome, marca: e.marca, ano: e.ano, cor: e.cor));
        });
      }

      return veiculos_modelos_view_model;
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> cadastrarVeiculo(
      CadastrarVeiculoViewModal veiculo_view_model) async {
    try {
      final modelo = await veiculoRepository
          .obterModeloPorId(veiculo_view_model.modelo_id);

      final veiculo = Veiculo(
          modelo: modelo,
          placa: veiculo_view_model.placa,
          chassi: veiculo_view_model.chassi,
          valor: veiculo_view_model.valor,
          data_compra: DateTime.now(),
          id: veiculo_view_model.id);

      await veiculoRepository.adicionarVeiculo(veiculo);

      await veiculoRepository.atualizarEstoque(modelo.id, modelo.estoque + 1);
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> debitarEstoqueModeloPorVeiculo(String id, int quantidade) async {
    try {
      final veiculo = await veiculoRepository.obterVeiculoPorId(id);

      await veiculoRepository.atualizarEstoque(
          veiculo.modelo.id, veiculo.modelo.estoque - quantidade);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
