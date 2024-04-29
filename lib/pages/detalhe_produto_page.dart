import 'package:flutter/material.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/util/moeda.dart';

class DetalheprodutoPage extends StatelessWidget {
  const DetalheprodutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context) devolve a rota que foi usada
    //para chegar até aqui
    //
    // ModalRoute.of(context)?.settings.arguments devolve 0
    //argumento (parametro) que foi passado para essa tela
    //se houver
    final arg = ModalRoute.of(context)?.settings.arguments;

    final veioParamentro = arg != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhe do produto"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: veioParamentro ? body(arg as Produto) : bodyEmpty(),
    );
  }

  Widget bodyEmpty() {
    return const Center(
      child: Text("Não foi recebido nenhum parâmetro"),
    );
  }

  Widget body(Produto produto) {
    return Column(
      children: [
        Image.network(
          produto.foto,
          width: 200,
          height: 200,
        ),
        Text(produto.nome),
        Text(produto.categoria),
        Text(produto.estoque.toString()),
        Text(formataMoeda(produto.preco)),
      ],
    );
  }
}
