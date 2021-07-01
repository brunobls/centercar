import 'dart:convert';

import 'package:core/domain_objects/entity.dart';

class Modelo extends Entity {
  late String _nome;
  late String _id;
  late String _marca;
  late int _ano;
  late String _cor;
  late int _estoque;

  String get nome => _nome;
  String get id => _id;
  String get marca => _marca;
  int get ano => _ano;
  String get cor => _cor;
  int get estoque => _estoque;

  Modelo({
    required nome,
    required id,
    required marca,
    required ano,
    required cor,
    required estoque,
  }) {
    _nome = nome;
    _id = id;
    _marca = marca;
    _ano = ano;
    _cor = cor;
    _estoque = estoque;
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': _nome,
      'id': _id,
      'marca': _marca,
      'ano': _ano,
      'cor': _cor,
      'estoque': _estoque
    };
  }

  factory Modelo.fromMap(Map<String, dynamic> map) {
    return Modelo(
        nome: map['nome'],
        id: map['id'],
        marca: map['marca'],
        ano: map['ano'],
        cor: map['cor'],
        estoque: map['estoque']);
  }

  String toJson() => json.encode(toMap());

  factory Modelo.fromJson(String source) => Modelo.fromMap(json.decode(source));
}
