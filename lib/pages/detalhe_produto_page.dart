import 'package:flutter/material.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/util/moeda.dart';

class DetalheProdutoPage extends StatelessWidget {
  const DetalheProdutoPage({super.key});

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
      body: veioParamentro ? body(context, arg as Produto) : bodyEmpty(),
    );
  }

  Widget bodyEmpty() {
    return const Center(
      child: Text("Não foi recebido nenhum parâmetro"),
    );
  }

  Widget body(BuildContext context, Produto produto) {
    final temaTexto = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
          child: Image.network(
            produto.foto,
            width: 300,
            height: 300,
          ),
        ),
        Text(
          produto.nome,
          style: temaTexto.titleLarge,
        ),
        Text(
          produto.categoria,
          style: temaTexto.bodySmall,
        ),
        Text(produto.estoque.toString()),
        Text(formataMoeda(produto.preco)),
      ],
    );
  }
}
