import 'package:relatorio/business/indicadores.dart';
import 'package:relatorio/business/irelatorio_repository.dart';
import 'package:relatorio/business/irelatorio_service.dart';

class RelatorioService implements IRelatorioService {
  final IRelatorioRepository relatorioRepository;

  RelatorioService(this.relatorioRepository);

  @override
  Future<Indicadores> obterIndicadores() async {
    try {
      return await relatorioRepository.obterIndicadores();
    } catch (e) {
      throw UnimplementedError();
    }
  }
}
