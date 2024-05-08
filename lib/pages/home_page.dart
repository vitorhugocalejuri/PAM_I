import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/componentes/produto_item_list.dart';
import 'package:quitanda/vm/catalogo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //na linha abaixo a gente esta pedindo um catalogo gerenciado
    //para o provider. A partir de agora, toda mudança no Catalogo
    //vai causar uma atualização aqui
    final catalogo = Provider.of<Catalogo>(context);

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
        itemCount: catalogo.produtos.length,
        //GestureDeetector: ele é um componente que permite ataxar algum evento,
        //exemplo ele consegue ataxar o clique de algum elemento
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushNamed(context, "/detail",
              arguments: catalogo.produtos[index].id),
          child: ProdutoItemList(
            produto: catalogo.produtos[index],
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
