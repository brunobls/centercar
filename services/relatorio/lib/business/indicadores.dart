import 'dart:convert';

class Indicadores {
  double _valor_total_em_compras = 0.0;
  double _valor_total_em_vendas = 0.0;
  double _lucro_ou_prejuizo = 0.0;
  double _valor_pago_em_comissao = 0.0;

  double get valor_total_em_compras => _valor_total_em_compras;
  double get valor_total_em_vendas => _valor_total_em_vendas;
  double get lucro_ou_prejuizo => _lucro_ou_prejuizo;
  double get valor_pago_em_comissao => _valor_pago_em_comissao;

  Indicadores({
    valor_total_em_compras,
    valor_total_em_vendas,
    lucro_ou_prejuizo,
    valor_pago_em_comissao,
  }) {
    _valor_total_em_compras = valor_total_em_compras;
    _valor_total_em_vendas = valor_total_em_vendas;
    _lucro_ou_prejuizo = lucro_ou_prejuizo;
    _valor_pago_em_comissao = valor_pago_em_comissao;
  }

  Map<String, dynamic> toMap() {
    return {
      'valor_total_em_compras': _valor_total_em_compras,
      'valor_total_em_vendas': _valor_total_em_vendas,
      'lucro_ou_prejuizo': _lucro_ou_prejuizo,
      'valor_pago_em_comissao': _valor_pago_em_comissao,
    };
  }

  factory Indicadores.fromMap(Map<String, dynamic> map) {
    return Indicadores(
      valor_total_em_compras: map['valor_total_em_compras'],
      valor_total_em_vendas: map['valor_total_em_vendas'],
      lucro_ou_prejuizo: map['lucro_ou_prejuizo'],
      valor_pago_em_comissao: map['valor_pago_em_comissao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Indicadores.fromJson(String source) =>
      Indicadores.fromMap(json.decode(source));
}
