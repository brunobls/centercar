import 'package:relatorio/business/indicadores.dart';

abstract class IRelatorioRepository {
  Future<Indicadores> obterIndicadores();
}
