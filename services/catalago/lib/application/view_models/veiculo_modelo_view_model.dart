import 'dart:convert';

class VeiculoModeloViewModel {
  late String _id;
  late String _nome;
  late String _marca;
  late int _ano;
  late String _cor;

  VeiculoModeloViewModel({
    required id,
    required nome,
    required marca,
    required ano,
    required cor,
  }) {
    _id = id;
    _nome = nome;
    _marca = marca;
    _ano = ano;
    _cor = cor;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
      'nome': _nome,
      'marca': _marca,
      'ano': _ano,
      'cor': _cor,
    };
  }

  factory VeiculoModeloViewModel.fromMap(Map<String, dynamic> map) {
    return VeiculoModeloViewModel(
      id: map['id'],
      nome: map['nome'],
      marca: map['marca'],
      ano: map['ano'],
      cor: map['cor'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VeiculoModeloViewModel.fromJson(String source) =>
      VeiculoModeloViewModel.fromMap(json.decode(source));
}
