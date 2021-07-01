import 'package:app/app/components/bottom_navigation.dart';
import 'package:app/app/components/generic_text_form_field.dart';
import 'package:app/app/modules/cadastro/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cadastro_controller.dart';

class CadastroPage extends GetView<CadastroController> {
  static const String ROUTE_PAGE = '/cadastro';

  final placaEditingController = TextEditingController();
  final chassiEditingController = TextEditingController();
  final corEditingController = TextEditingController();
  final valorEditingController = TextEditingController();
  final anoEditingController = TextEditingController();
  final qtdEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar novos veículos'),
      ),
      bottomNavigationBar: BottomNavigation(currentindex: 1),
      body: Column(
        children: [
          Dropdown(),
          GenericTextFormField(
            label: 'Placa',
            validator: (v) {},
            controller: placaEditingController,
            type: TextInputType.text,
          ),
          GenericTextFormField(
            label: 'Chassi',
            validator: (v) {},
            controller: chassiEditingController,
            type: TextInputType.text,
          ),
          GenericTextFormField(
            label: 'Valor',
            validator: (v) {},
            controller: valorEditingController,
            type: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              final placa = placaEditingController.text;
              final chassi = chassiEditingController.text;
              final valor = double.parse(valorEditingController.text);

              controller.cadastrarVeiculo(placa, chassi, valor);
            },
            child: const Text('comprar'),
          )
        ],
      ),
    );
  }
}
