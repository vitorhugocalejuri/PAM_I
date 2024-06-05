import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/componentes/produto_item_list.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //na linha abaixo a gente esta pedindo um catalogo gerenciado
    //para o provider. A partir de agora, toda mudança no Catalogo
    //vai causar uma atualização aqui
    final catalogo = Provider.of<Catalogo>(context);
    final carrinho = Provider.of<Carrinho>(context);

    int quantidade = carrinho.pedido.quantidade;

    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content:
    //           Text("Que tal comprar: ${catalogo.findByMaiorEstoque().nome}"),
    //     ),
    //   );
    // });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Badge(
            label: Text("$quantidade"),
            isLabelVisible: quantidade > 0,
            alignment: Alignment.bottomLeft,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(
                context,
                "/carrinho",
              ),
              icon: const Icon(Icons.shopping_cart),
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              "/perfil",
            ),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: catalogo.produtos.length,
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushNamed(
            context,
            "/detail",
            arguments: catalogo.produtos[index].id,
          ),
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
