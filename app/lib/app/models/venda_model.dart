import 'dart:convert';

class VendaModel {
  final String veiculo_id;
  final double valor;

  VendaModel(this.veiculo_id, this.valor);

  Map<String, dynamic> toMap() {
    return {
      'veiculo_id': veiculo_id,
      'valor': valor,
    };
  }

  String toJson() => json.encode(toMap());
}
