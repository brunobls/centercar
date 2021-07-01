import 'package:catalago/domain/modelo.dart';
import 'package:catalago/domain/veiculo.dart';

abstract class IVeiculoRepository {
  Future<List<Veiculo>> obterTodos();
  Future<List<Modelo>> obterTodosModelos();
  Future<Veiculo> obterVeiculoPorId(String id);
  Future<Modelo> obterModeloPorId(String id);
  Future<void> atualizarEstoque(String id, int quantidade);
  Future<void> adicionarVeiculo(Veiculo veiculo);
}
