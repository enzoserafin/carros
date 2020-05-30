
import 'file:///D:/Cursos/flutter/carros/lib/utils/sql/entity.dart';
import 'package:br/pages/carros/carro.dart';

class Favorito extends Entity {

  int id;
  String nome;

  Favorito.fromCarro(Carro c) {
    id = c.id;
    nome = c.nome;
  }

  Favorito.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    return data;
  }
}