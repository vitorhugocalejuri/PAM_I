import 'package:atividade/pages/detalhe_tarefa_page.dart';
import 'package:atividade/pages/esqueci_senha_page.dart';
import 'package:atividade/pages/home_page.dart';
import 'package:atividade/pages/login_page.dart';
import 'package:atividade/pages/nova_tarefa_page.dart';
import 'package:atividade/util/tema.dart';
import 'package:flutter/material.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atividade Avaliativa",
      theme: tema(),
      initialRoute: "/",
      routes: {
        "/": (_) => const LoginPage(),
        "/home": (_) => const HomePage(),
        "/nova": (_) => const NovaTarefaPage(),
        "/detalhe": (_) => const DetaheTarefaPage(),
        "/esqueci": (_) => const EsqueciSenhaPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
