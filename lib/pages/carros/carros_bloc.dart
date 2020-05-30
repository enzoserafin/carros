
import 'package:br/pages/carros/carro.dart';
import 'package:br/pages/carros/carros_api.dart';
import 'package:br/pages/carros/simple_bloc.dart';
import 'file:///D:/Cursos/flutter/carros/lib/pages/carros/carro_dao.dart';
import 'package:br/utils/network.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>>fetch(String tipo) async {
    try{

      bool networkOn = await isNetworkOn();

      if(!networkOn) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

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