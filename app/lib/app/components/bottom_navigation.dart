import 'package:app/app/modules/cadastro/cadastro.page.dart';
import 'package:app/app/modules/loja/loja_page.dart';
import 'package:app/app/modules/relatorio/relatorio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget {
  final int currentindex;

  const BottomNavigation({Key? key, required this.currentindex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentindex,
      items: [
        BottomNavigationBarItem(label: 'Loja', icon: Icon(Icons.home)),
        BottomNavigationBarItem(
            label: 'Cadastrar veículos', icon: Icon(Icons.app_registration)),
        BottomNavigationBarItem(
            label: 'Relatórios', icon: Icon(Icons.dashboard)),
      ],
      onTap: (i) async {
        switch (i) {
          case 0:
            Get.offNamed(LojaPage.ROUTE_PAGE);
            break;
          case 1:
            Get.offNamed(CadastroPage.ROUTE_PAGE);
            break;
          case 2:
            Get.offNamed(RelatorioPage.ROUTE_PAGE);
            break;
          default:
        }
      },
    );
  }
}
