import 'dart:convert';

import 'package:uuid/uuid.dart';

class VeiculoCadastroModel {
  final String id = Uuid().v1();
  final String modelo_id;
  final String placa;
  final String chassi;
  final double valor;

  VeiculoCadastroModel({
    required this.modelo_id,
    required this.placa,
    required this.chassi,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'modelo_id': modelo_id,
      'placa': placa,
      'chassi': chassi,
      'valor': valor,
    };
  }

  String toJson() => json.encode(toMap());
}
