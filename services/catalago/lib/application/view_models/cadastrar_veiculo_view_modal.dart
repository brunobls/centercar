import 'dart:convert';

class CadastrarVeiculoViewModal {
  final String _id;
  final String _modelo_id;
  final String _placa;
  final String _chassi;
  final double _valor;

  String get id => _id;
  String get modelo_id => _modelo_id;
  String get placa => _placa;
  String get chassi => _chassi;
  double get valor => _valor;

  CadastrarVeiculoViewModal(
      this._modelo_id, this._placa, this._chassi, this._valor, this._id);

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'modelo_id': _modelo_id,
      'placa': _placa,
      'chassi': _chassi,
      'valor': _valor,
    };
  }

  factory CadastrarVeiculoViewModal.fromMap(Map<String, dynamic> map) {
    return CadastrarVeiculoViewModal(
      map['modelo_id'],
      map['placa'],
      map['chassi'],
      double.parse(map['valor'].toString()),
      map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CadastrarVeiculoViewModal.fromJson(String source) =>
      CadastrarVeiculoViewModal.fromMap(json.decode(source));
}
