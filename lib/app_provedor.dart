import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/app.dart';
import 'package:quitanda/repositorio/repositorio_produto.dart';
import 'package:quitanda/vm/catalogo.dart';

class AppProvedor extends StatelessWidget {
  const AppProvedor({super.key});

  @override
  Widget build(BuildContext context) {
    //MultiProvider é uma espécie de container
    //que permite ao filho ter acesso aos provedores definidos

    return MultiProvider(
      providers: [
        Catalogo.create(RepositorioProduto()),
      ],
      child: const Aplicacao(),
    );
  }
}
