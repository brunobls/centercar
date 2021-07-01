import 'dart:convert';

import 'package:core/domain_objects/entity.dart';
import 'package:core/domain_objects/iaggregate_root.dart';
import 'package:venda/domain/veiculo.dart';

class Venda extends Entity implements IAggregateRoot {
  late String _id;
  late DateTime _data;
  late Veiculo _veiculo;
  late double _valor;
  late double _comissao_vendedor;

  String get id => _id;
  DateTime get data => _data;
  Veiculo get veiculo => _veiculo;
  double get valor => _valor;
  double get comissao_vendedor => _comissao_vendedor;

  Venda({
    required id,
    required data,
    required veiculo,
    required valor,
  }) {
    _id = id;
    _data = data;
    _veiculo = veiculo;
    _valor = valor;
    _comissao_vendedor = _calcularComissaoVendedor(_valor);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'data': _data,
      'veiculo': _veiculo,
      'valor': _valor,
      'comissao_vendedor': _comissao_vendedor,
    };
  }

  double _calcularComissaoVendedor(double valor_venda) {
    return valor_venda * 0.1;
  }

  factory Venda.fromMap(Map<String, dynamic> map) {
    return Venda(
      id: map['id'],
      data: map['data'],
      veiculo: Veiculo.fromMap(map['veiculo']),
      valor: map['valor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Venda.fromJson(String source) => Venda.fromMap(json.decode(source));

  @override
  List<Object> get props => [_id, _data, _veiculo, _valor, _comissao_vendedor];

  @override
  String toString() {
    return 'Veiculo(_id: $_id, data: $_data, veiculo: $_veiculo, valor: $_valor, comissao_vendedor: $_comissao_vendedor)';
  }
}
