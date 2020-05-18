
import 'dart:async';

import 'package:br/pages/api_response.dart';
import 'package:br/pages/carro/simple_bloc.dart';
import 'package:br/pages/login/login_api.dart';
import 'package:br/pages/login/usuario.dart';

class LoginBloc extends SimpleBloc<bool> {

  Future<ApiResponse<Usuario>> login(String login, String password) async {

    add(true);

    ApiResponse response = await LoginApi.login(login, password);

    add(false);

    return response;
  }
}