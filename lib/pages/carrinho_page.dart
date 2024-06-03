import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/item_pedido.dart';
import 'package:quitanda/util/moeda.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<Carrinho>(context);
    final catalogo = Provider.of<Catalogo>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            item(context, ItemPedido.fromProduto(catalogo.produtos[0])),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Pagar: R\$ XX,XX"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(BuildContext context, ItemPedido? item) {
    return Material(
      elevation: 10,
      child: Container(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
        padding: const EdgeInsets.all(8),
        width: double.maxFinite,
        child: Row(
          children: [
            Image.network(
              item.produto.foto,
              height: 56,
              width: 56,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Text(item.nome),
                    Row(
                      children: [
                        Text("${item.quantidade}"),
                        const Text("x"),
                        Text(formataMoeda(item.preco)),
                        Text(formataMoeda(item.preco * item.quantidade)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
