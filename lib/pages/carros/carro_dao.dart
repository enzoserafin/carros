
import 'package:br/pages/carros/carro.dart';
import 'file:///D:/Cursos/flutter/carros/lib/utils/sql/base_dao.dart';

// Data Access Object
class CarroDAO extends BaseDAO<Carro> {

  @override
  String get tableName => "carro";

  @override
  Carro fromMap(Map<String, dynamic> map) {
    return Carro.fromMap(map);
  }

  Future<List<Carro>> findAllByTipo(String tipo) async {
    List<Carro> carros = await query('select * from carro where tipo =? ',[tipo]);

    return carros;
  }
}
