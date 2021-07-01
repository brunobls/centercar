import 'package:venda/domain/venda.dart';

abstract class IVendaRepository {
  Future<void> atualizarEstoque(String id, int quantidade);
  Future<void> realizarVenda(Venda venda);
}
