
import 'package:br/pages/carros/carro.dart';
import 'package:br/pages/carros/carros_api.dart';
import 'package:br/pages/carros/simple_bloc.dart';
import 'package:br/pages/favoritos/favorito_service.dart';
import 'file:///D:/Cursos/flutter/carros/lib/pages/carros/carro_dao.dart';
import 'package:br/utils/network.dart';

class FavoritosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>> fetch() async {
    try{

      List<Carro> carros = await FavoritoService.getCarros();

      if (carros.isNotEmpty) {
        final dao =  CarroDAO();

        carros.forEach(dao.save);
      }

      add(carros);

      return carros;
    } catch (e) {
      addError(e);
    }
  }
}