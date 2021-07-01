import 'package:app/app/components/bottom_navigation.dart';
import 'package:app/app/modules/relatorio/relatorio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RelatorioPage extends GetView<RelatorioController> {
  static const String ROUTE_PAGE = '/relatorio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relatórios de desempenho'),
      ),
      bottomNavigationBar: BottomNavigation(currentindex: 2),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Obx(() => ListView(
                children: <Widget>[
                  Card(
                    child: ListTile(
                        title: Text('Valor total em compras:'),
                        subtitle: Text(
                            'R\$ ' + controller.valor_em_compras.toString())),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Valor total em vendas:'),
                        subtitle: Text(
                            'R\$ ' + controller.valor_em_vendas.toString())),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Lucro/prejuízo do mês:'),
                        subtitle: Text(
                            'R\$ ' + controller.lucro_prejuizo.toString())),
                  ),
                  Card(
                    child: ListTile(
                        title: Text('Valor pago em comissão:'),
                        subtitle: Text(
                            'R\$ ' + controller.pago_em_comissao.toString())),
                  )
                ],
              ))),
    );
  }
}
