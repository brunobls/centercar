import 'package:app/app/components/bottom_navigation.dart';
import 'package:app/app/modules/loja/widgets/veiculo_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loja_controller.dart';

class LojaPage extends GetView<LojaController> {
  static const String ROUTE_PAGE = '/';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Loja center car'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Disponíveis',
                ),
                Tab(
                  text: 'Vendidos',
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigation(currentindex: 0),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      child: Text(
                        'Lista de veículos para compra:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Obx(
                              () => ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.veiculos_disponiveis.length,
                                  itemBuilder: (_, index) {
                                    return VeiculoItem(
                                        controller.veiculos_disponiveis[index],
                                        true);
                                  }),
                            )))
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                      child: Text(
                        'Lista de veículos vendidos:',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Obx(
                              () => ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      controller.veiculos_vendidos.length,
                                  itemBuilder: (_, index) {
                                    return VeiculoItem(
                                        controller.veiculos_vendidos[index],
                                        false);
                                  }),
                            )))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
