import 'package:app/app/models/modelos_item_model.dart';
import 'package:app/app/models/veiculo_cadastro_model.dart';
import 'package:app/helpers/rest_client.dart';

class CadastroRepository {
  final RestClient restClient;

  CadastroRepository(this.restClient);

  Future<List<ModelosItemModel>> obterTodosModelos() async {
    final response = await restClient
        .get<List<ModelosItemModel>>('/catalago/modelos', decoder: (resp) {
      if (resp is List) {
        return resp
            .map<ModelosItemModel>((v) => ModelosItemModel.fromMap(v))
            .toList();
      }
      return [];
    });

    if (response.hasError) {
      throw RestClientException('Error ao obter todos os modelos');
    }

    return response.body!;
  }

  Future<void> cadastrarVeiculos(VeiculoCadastroModel model) async {
    final response = await restClient.post('/catalago/', model.toMap());

    if (response.hasError) {
      throw RestClientException('Error ao cadastrar veículos');
    }
  }
}
