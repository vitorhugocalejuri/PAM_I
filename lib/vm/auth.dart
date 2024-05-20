import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/usuario.dart';

class Auth extends ChangeNotifier {
  //Usuario? => significa que a variavel aceita o tipo Usuario ou null
  Usuario? _usuario;
  bool _logado = false;
  DateTime? _logouEm;

  void login(String usuario, String senha) {
    if (usuario == "admin" && senha == "123") {
      _usuario = Usuario(
        email: "admin@quitanda.com.br",
        login: "admin",
        nome: "Administrador",
      );

      _logouEm = DateTime.now();
      _logado = true;
      notifyListeners();
      return;
    }

    throw Exception("Credenciais inválidas");
  }

  void logout() {
    _usuario = null;
    _logado = false;
  }

  Usuario? get usuario => _usuario;
  bool get estaLogado => _logado;
  DateTime? get logouEm => _logouEm;

  static ChangeNotifierProvider<Auth> create() =>
      ChangeNotifierProvider(create: (_) => Auth());
}
