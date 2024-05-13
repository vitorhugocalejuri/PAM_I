import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/usuario.dart';

class Auth extends ChangeNotifier {
  //Usuario? => signigica que a variável aceita o tipo Usuario ou null
  Usuario? _usuario;
  bool _logado = false;

  void login(String usuario, String senha) {
    if (usuario == "admin" && senha == "123") {
      _usuario = Usuario(
        email: "admin@quitanda.com.br",
        login: "admin",
        nome: "Adiministrador",
      );
      _logado = true;
      notifyListeners();
      return;
    }
    throw Exception("Credenciais inválidas!");
  }

  void logout() {
    _usuario = null;
    _logado = false;
    notifyListeners();
  }

  Usuario? get usuario => _usuario;
  bool get estaLogado => _logado;

  static ChangeNotifierProvider<Auth> create() =>
      ChangeNotifierProvider(create: (_) => Auth());
}
