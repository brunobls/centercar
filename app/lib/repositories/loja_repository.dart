import 'package:app/app/models/veiculo_item_model.dart';
import 'package:app/app/models/venda_model.dart';
import 'package:app/helpers/rest_client.dart';

class LojaRepository {
  final RestClient restClient;

  LojaRepository(this.restClient);

  Future<List<VeiculoItemModel>> obterTodos() async {
    final response = await restClient.get<List<VeiculoItemModel>>('/catalago/',
        decoder: (resp) {
      if (resp is List) {
        return resp.map<VeiculoItemModel>((v) {
          return VeiculoItemModel.fromMap(v);
        }).toList();
      }
      return [];
    });

    if (response.hasError) {
      throw RestClientException('Error ao buscar a lista de veículos');
    }

    return response.body!;
  }

  Future<void> realizarVenda(VendaModel veiculo) async {
    final response = await restClient.post('/venda/', veiculo.toMap());

    if (response.hasError) {
      throw RestClientException('Error ao cadastrar veículos');
    }
  }
}
