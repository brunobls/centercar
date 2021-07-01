import 'package:catalago/application/services/iveiculo_service.dart';
import 'package:uuid/uuid.dart';
import 'package:venda/application/services/ivenda_service.dart';
import 'package:venda/application/view_models/venda_view_modal.dart';
import 'package:venda/domain/ivenda_repository.dart';
import 'package:venda/domain/veiculo.dart';
import 'package:venda/domain/venda.dart';

class VendaService implements IVendaService {
  final IVendaRepository vendaRepository;
  final IVeiculoService veiculoService;

  VendaService(this.vendaRepository, this.veiculoService);

  @override
  Future<void> realizarVenda(VendaViewModal venda_view_modal) async {
    try {
      final venda = Venda(
          id: Uuid().v1(),
          data: DateTime.now(),
          veiculo: Veiculo(id: venda_view_modal.veiculo_id),
          valor: venda_view_modal.valor);

      await vendaRepository.realizarVenda(venda);

      await veiculoService.debitarEstoqueModeloPorVeiculo(
          venda_view_modal.veiculo_id, 1);
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
