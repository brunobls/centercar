import 'package:app/app/modules/cadastro/cadastro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dropdown extends GetView<CadastroController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                  alignedDropdown: true,
                  child: Obx(
                    () => DropdownButton<String>(
                      value: controller.veiculo_modelos_selected.value,
                      iconSize: 30,
                      icon: (null),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      hint: Text('Seleciona o modelo'),
                      onChanged: (item) => {
                        controller.veiculo_modelos_selected.value =
                            item.toString()
                      },
                      items: controller.veiculo_modelos.map((modelo) {
                        return new DropdownMenuItem(
                          child: new Text(modelo.marca +
                              '  |  ' +
                              modelo.nome +
                              '  |  ' +
                              modelo.ano.toString() +
                              '  |  ' +
                              modelo.cor),
                          value: modelo.id,
                        );
                      }).toList(),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
