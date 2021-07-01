import 'package:relatorio/business/indicadores.dart';

abstract class IRelatorioService {
  Future<Indicadores> obterIndicadores();
}
