import 'package:atividade/entidade/usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Login extends ChangeNotifier {
  Usuario? _usuarioLogado;

  void login(String login, String senha) {
    if (login == "aluno" && senha == "123456") {
      _usuarioLogado = Usuario(
        login: "aluno",
        email: "aluno@etec.sp.gov.br",
        nome: "Aluno da Etec",
      );

      notifyListeners();
      return;
    }

    throw Exception("Credenciais inválidas!");
  }

  void logout() {
    _usuarioLogado = null;

    notifyListeners();
  }

  Usuario? get usuarioLogado => _usuarioLogado;
  bool get usuarioEstaLogado => _usuarioLogado != null;

  static ChangeNotifierProvider<Login> criar() =>
      ChangeNotifierProvider(create: (_) => Login());
}
