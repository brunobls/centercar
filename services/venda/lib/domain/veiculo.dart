import 'dart:convert';

import 'package:core/domain_objects/entity.dart';

class Veiculo extends Entity {
  late String _id;

  String get id => _id;

  Veiculo({required id}) {
    _id = id;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': _id,
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Veiculo.fromJson(String source) =>
      Veiculo.fromMap(json.decode(source));

  @override
  // TODO: implement props
  List<Object?> get props => [_id];
}
