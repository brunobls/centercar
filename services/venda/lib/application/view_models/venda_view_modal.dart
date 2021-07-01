import 'dart:convert';

class VendaViewModal {
  late String _veiculo_id;
  late double _valor;

  String get veiculo_id => _veiculo_id;
  double get valor => _valor;

  VendaViewModal({
    required veiculo_id,
    required valor,
  }) {
    _veiculo_id = veiculo_id;
    _valor = valor;
  }

  Map<String, dynamic> toMap() {
    return {
      'veiculo_id': _veiculo_id,
      'valor': _valor,
    };
  }

  factory VendaViewModal.fromMap(Map<String, dynamic> map) {
    return VendaViewModal(
      veiculo_id: map['veiculo_id'],
      valor: double.parse(map['valor'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory VendaViewModal.fromJson(String source) =>
      VendaViewModal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VendaViewModal(veiculo_id: $_veiculo_id, valor: $_valor)';
  }
}
