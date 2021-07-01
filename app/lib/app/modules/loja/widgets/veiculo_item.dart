import 'package:app/app/components/generic_text_form_field.dart';
import 'package:app/app/models/veiculo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../loja_controller.dart';

class VeiculoItem extends GetView<LojaController> {
  final VeiculoItemModel _veiculo_item;
  final formatter = NumberFormat('###.00', 'pt_br');
  final bool disponivel_para_compra;
  final valorVendidoEditingController = TextEditingController();

  VeiculoItem(this._veiculo_item, this.disponivel_para_compra);

  @override
  Widget build(BuildContext context) {
    valorVendidoEditingController.text = _veiculo_item.valor.toString();

    return Column(
      children: [
        ListTile(
            title: Text(
              _veiculo_item.modelo +
                  ' | ' +
                  _veiculo_item.marca +
                  ' | ' +
                  _veiculo_item.ano.toString() +
                  (disponivel_para_compra
                      ? ' | ' + 'R\$ ' + formatter.format(_veiculo_item.valor)
                      : ''),
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text('Cor: ' +
                _veiculo_item.cor +
                ' | Placa: ' +
                _veiculo_item.placa +
                ' | Chassi: ' +
                _veiculo_item.chassi),
            trailing: disponivel_para_compra
                ? ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Checkout'),
                        content: GenericTextFormField(
                          label: 'Valor da venda',
                          validator: (v) {},
                          controller: valorVendidoEditingController,
                          type: TextInputType.number,
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancelar compra'),
                          ),
                          TextButton(
                            onPressed: () {
                              if (valorVendidoEditingController.text != '') {
                                controller.realizarVenda(
                                    _veiculo_item.id,
                                    double.parse(
                                        valorVendidoEditingController.text));
                                Navigator.pop(context, 'OK');
                              }
                            },
                            child: const Text('Finalizar compra'),
                          ),
                        ],
                      ),
                    ),
                    child: const Text('comprar'),
                  )
                : null),
        Divider()
      ],
    );
  }
}
