import 'package:flutter/material.dart';
import 'package:quitanda/login_page.dart';
import 'package:quitanda/pages/carrinho_page.dart';
import 'package:quitanda/pages/detalhe_produto_page.dart';
import 'package:quitanda/pages/home_page.dart';
import 'package:quitanda/util/tema.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: temaPadrao(),
      routes: {
        "/": (context) => const HomePage(),
        "/detail": (context) => const DetalheProdutoPage(),
        "/carrinho": (context) => const CarrinhoPage(),
        "/login": (context) => const LoginPage(),
      },
      initialRoute: "/login",
      debugShowCheckedModeBanner: false,
    );
  }
}
