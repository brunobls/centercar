import 'package:venda/application/view_models/venda_view_modal.dart';

abstract class IVendaService {
  Future<void> realizarVenda(VendaViewModal venda);
}
