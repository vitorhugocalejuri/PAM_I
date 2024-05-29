import 'package:atividade/app.dart';
import 'package:atividade/vm/gestor_tarefa.dart';
import 'package:atividade/vm/login.dart';
import 'package:atividade/vm/senha.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Login.criar(),
        Senha.criar(),
        GestorTarefa.criar(),
      ],
      child: const Aplicacao(),
    );
  }
}
