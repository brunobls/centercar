import 'package:gateway/controllers/relatorio/relatorio/relatorio_controller.dart';
import 'package:get_it/get_it.dart';

import 'package:core/database/mysql/database_connection.dart';

import 'package:catalago/application/services/veiculo_service.dart';
import 'package:catalago/infra/repository/veiculo_repository.dart';

import 'package:gateway/controllers/catalago/catalago_controller.dart';
import 'package:gateway/controllers/venda/venda_controller.dart';
import 'package:relatorio/business/relatorio_service.dart';

import 'package:relatorio/infra/repository/relatorio_repository.dart';

import 'package:venda/application/services/venda_service.dart';
import 'package:venda/infra/repository/venda_repository.dart';

final GetIt getIt = GetIt.instance;

void configureServiceLocatorGateway() async {
  // Infra
  getIt.registerSingleton<DatabaseConnection>(DatabaseConnection());

  // Contexto de catálago
  getIt.registerSingleton<VeiculoRepository>(
      VeiculoRepository(connection: getIt<DatabaseConnection>()));
  getIt.registerSingleton<VeiculoService>(
      VeiculoService(veiculoRepository: getIt<VeiculoRepository>()));
  getIt.registerSingleton<CatalagoController>(
      CatalagoController(veiculoService: getIt<VeiculoService>()));

  // Contexto de venda
  getIt.registerSingleton<VendaRepository>(
      VendaRepository(connection: getIt<DatabaseConnection>()));
  getIt.registerSingleton<VendaService>(
      VendaService(getIt<VendaRepository>(), getIt<VeiculoService>()));
  getIt.registerSingleton<VendaController>(
      VendaController(vendaService: getIt<VendaService>()));

  // Contexo de relatorio
  getIt.registerSingleton<RelatorioRepository>(
      RelatorioRepository(connection: getIt<DatabaseConnection>()));
  getIt.registerSingleton<RelatorioService>(
      RelatorioService(getIt<RelatorioRepository>()));
  getIt.registerSingleton<RelatorioController>(
      RelatorioController(relatorioService: getIt<RelatorioService>()));

  await getIt.allReady();
}
