import 'dart:convert';

class ModelosItemModel {
  final String id;
  final String nome;
  final String marca;
  final int ano;
  final String cor;

  ModelosItemModel(this.id, this.nome, this.marca, this.ano, this.cor);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'marca': marca,
      'ano': ano,
      'cor': cor,
    };
  }

  factory ModelosItemModel.fromMap(Map<String, dynamic> map) {
    return ModelosItemModel(
      map['id'],
      map['nome'],
      map['marca'],
      map['ano'],
      map['cor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelosItemModel.fromJson(String source) =>
      ModelosItemModel.fromMap(json.decode(source));
}
