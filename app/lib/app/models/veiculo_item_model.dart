import 'dart:convert';

class VeiculoItemModel {
  final String id;
  final String modelo;
  final String marca;
  final int ano;
  final String placa;
  final String cor;
  final String chassi;
  final double valor;
  final bool vendido;

  VeiculoItemModel({
    required this.id,
    required this.modelo,
    required this.marca,
    required this.ano,
    required this.placa,
    required this.cor,
    required this.chassi,
    required this.valor,
    required this.vendido,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'modelo': modelo,
      'marca': marca,
      'ano': ano,
      'placa': placa,
      'cor': cor,
      'chassi': chassi,
      'valor': valor,
      'vendido': vendido,
    };
  }

  factory VeiculoItemModel.fromMap(Map<String, dynamic> map) {
    return VeiculoItemModel(
      id: map['id'],
      modelo: map['modelo'],
      marca: map['marca'],
      ano: map['ano'],
      placa: map['placa'],
      cor: map['cor'],
      chassi: map['chassi'],
      valor: map['valor'],
      vendido: map['vendido'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VeiculoItemModel.fromJson(String source) =>
      VeiculoItemModel.fromMap(json.decode(source));
}
