import 'package:flutter/material.dart';
import 'package:quitanda/componentes/produto_item_list.dart';
import 'package:quitanda/repositorio/repositorio_produto.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repositorio = RepositorioProduto();
    final produtos = repositorio.select();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/carrinho",
            ),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: produtos.length,
        //GestureDeetector: ele é um componente que permite ataxar algum evento,
        //exemplo ele consegue ataxar o clique de algum elemento
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushNamed(context, "/detail",
              arguments: produtos[index]),
          child: ProdutoItemList(
            produto: produtos[index],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
