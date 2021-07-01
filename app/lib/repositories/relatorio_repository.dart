import 'package:app/app/models/relatorio_model.dart';
import 'package:app/helpers/rest_client.dart';

class RelatorioRepository {
  final RestClient restClient;

  RelatorioRepository(this.restClient);

  Future<RelatorioModel> obterRelatorio() async {
    final response =
        await restClient.get<RelatorioModel>('/relatorio/', decoder: (resp) {
      return RelatorioModel.fromMap(resp);
    });

    if (response.hasError) {
      throw RestClientException('Error ao obter os relatórios');
    }

    return response.body!;
  }
}
