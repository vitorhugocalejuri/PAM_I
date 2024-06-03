import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/util/moeda.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class DetalheProdutoPage extends StatelessWidget {
  const DetalheProdutoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ModalRoute.of(context) devolve a rota que foi usada pra chegar até aqui
    // ModalRoute.of(context) mostra como você chegou até aqui
    //
    //ModalRoute.of(context)?.settings.arguments devolve o argumento
    //(parametro) que foi passado para essa tela se houver
    final arg = ModalRoute.of(context)?.settings.arguments;

    final veioParametro = arg != null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhe do Produto"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: veioParametro ? body(context, arg as String) : bodyEmpty(),
        ),
      ),
    );
  }

  Widget bodyEmpty() {
    return const Center(
      child: Text("Não foi recebido nenhum parametro"),
    );
  }

  Widget body(BuildContext context, String idproduto) {
    final temaTexto = Theme.of(context).textTheme;

    final catalogo = Provider.of<Catalogo>(context);
    final produto = catalogo.findById(idproduto);

    final carrinho = Provider.of<Carrinho>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.network(
              produto.foto,
              width: 300,
              height: 300,
            ),
          ),
          detalhe(
            "Nome",
            produto.nome,
            temaTexto.titleLarge,
          ),
          detalhe(
            "Categoria",
            produto.categoria,
            temaTexto.bodySmall,
          ),
          detalhe("Estoque", produto.estoque.toString(), null),
          detalhe("Preço", formataMoeda(produto.preco), null),
          produto.temEstoque
              ? botaoAdicionar(carrinho, produto)
              : estoqueIndisponivel(context),
        ],
      ),
    );
  }

  Widget botaoAdicionar(Carrinho carrinho, Produto produto) => SizedBox(
        width: 300,
        child: ElevatedButton(
          onPressed: () => carrinho.adicionaItem(produto),
          child: const Text("Adcionar"),
        ),
      );

  Widget estoqueIndisponivel(BuildContext context) => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        width: double.maxFinite,
        color: Theme.of(context).colorScheme.tertiary,
        child: Text(
          "Não é permitido adicionar. Estoque indisponível",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
        ),
      );

  Widget detalhe(String label, String conteudo, TextStyle? style) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: style,
            ),
          ),
          Text(
            conteudo,
            style: style,
          ),
        ],
      ),
    );
  }
}
