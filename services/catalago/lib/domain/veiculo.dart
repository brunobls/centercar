import 'dart:convert';

import 'package:core/domain_objects/entity.dart';
import 'package:core/domain_objects/iaggregate_root.dart';

import 'modelo.dart';

class Veiculo extends Entity implements IAggregateRoot {
  late String _id;
  late Modelo _modelo;
  late String _placa;
  late String _chassi;
  late double _valor;
  late DateTime _data_compra;
  late DateTime? _data_venda;

  String get id => _id;
  Modelo get modelo => _modelo;
  String get placa => _placa;
  String get chassi => _chassi;
  double get valor => _valor;
  DateTime get data_compra => _data_compra;
  bool get vendido => _data_venda == null ? false : true;

  Veiculo(
      {required Modelo modelo,
      required String placa,
      required String chassi,
      required double valor,
      required DateTime data_compra,
      required String id,
      DateTime? data_venda}) {
    _modelo = modelo;
    _placa = placa;
    _chassi = chassi;
    _valor = valor;
    _data_compra = data_compra;
    _id = id;
    _data_venda = data_venda;
  }

  @override
  List<Object> get props =>
      [_id, _modelo, _placa, _chassi, _valor, _data_compra];

  Veiculo copyWith({
    String? id,
    Modelo? modelo,
    String? placa,
    String? chassi,
    double? valor,
    DateTime? data_compra,
    DateTime? data_venda,
  }) {
    return Veiculo(
        id: id ?? this._id,
        modelo: modelo ?? this._modelo,
        placa: placa ?? this._placa,
        chassi: chassi ?? this._chassi,
        valor: valor ?? this._valor,
        data_compra: data_compra ?? this._data_compra,
        data_venda: data_venda ?? this._data_venda);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'modelo': _modelo.toMap(),
      'placa': _placa,
      'chassi': _chassi,
      'valor': _valor,
      'data_compra': _data_compra,
      'data_venda': _data_venda,
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
        id: map['id'],
        modelo: Modelo.fromMap(map['modelo']),
        placa: map['placa'],
        chassi: map['chassi'],
        valor: map['valor'],
        data_compra: map['data_compra'],
        data_venda: map['data_venda']);
  }

  String toJson() => json.encode(toMap());

  factory Veiculo.fromJson(String source) =>
      Veiculo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Veiculo(_id: $_id, _modelo: $_modelo, _placa: $_placa, _chassi: $_chassi, _valor: $_valor, _data_compra: $_data_compra, _data_venda: $_data_venda)';
  }
}
