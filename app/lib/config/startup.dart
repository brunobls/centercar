import 'package:app/app/modules/cadastro/cadastro.page.dart';
import 'package:app/app/modules/cadastro/cadastro_bindings.dart';
import 'package:app/app/modules/loja/loja_bindings.dart';
import 'package:app/app/modules/loja/loja_page.dart';
import 'package:app/app/modules/relatorio/relatorio_bindings.dart';
import 'package:app/app/modules/relatorio/relatorio_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Startup {
  Startup._();

  static final appTheme = ThemeData(
    primaryColor: Color(0XFF9D0000),
    primarySwatch: Colors.red,
  );

  static final routes = [
    GetPage(
        name: LojaPage.ROUTE_PAGE,
        page: () => LojaPage(),
        binding: LojaBindings()),
    GetPage(
        name: CadastroPage.ROUTE_PAGE,
        page: () => CadastroPage(),
        binding: CadastroBindings()),
    GetPage(
        name: RelatorioPage.ROUTE_PAGE,
        page: () => RelatorioPage(),
        binding: RelatorioBindings()),
  ];
}
