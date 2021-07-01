import 'dart:convert';

class VeiculoViewModel {
  late String _id;
  late String _modelo;
  late String _marca;
  late int _ano;
  late String _placa;
  late String _cor;
  late String _chassi;
  late double _valor;
  late DateTime _data_compra;
  late bool _vendido;

  VeiculoViewModel(
      {required String modelo,
      required String marca,
      required int ano,
      required String placa,
      required String cor,
      required String chassi,
      required double valor,
      required DateTime data_compra,
      required String id,
      required bool vendido}) {
    _modelo = modelo;
    _marca = marca;
    _ano = ano;
    _placa = placa;
    _cor = cor;
    _chassi = chassi;
    _valor = valor;
    _data_compra = data_compra;
    _id = id;
    _vendido = vendido;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'modelo': _modelo,
      'marca': _marca,
      'ano': _ano,
      'placa': _placa,
      'cor': _cor,
      'chassi': _chassi,
      'valor': _valor,
      'vendido': _vendido
    };
  }

  factory VeiculoViewModel.fromMap(Map<String, dynamic> map) {
    return VeiculoViewModel(
      id: map['id'],
      modelo: map['modelo'],
      marca: map['marca'],
      ano: map['ano'],
      placa: map['placa'],
      cor: map['cor'],
      chassi: map['chassi'],
      valor: map['valor'],
      data_compra: map['data_compra'],
      vendido: map['vendido'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VeiculoViewModel.fromJson(String source) =>
      VeiculoViewModel.fromMap(json.decode(source));
}
