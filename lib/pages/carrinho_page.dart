import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/item_pedido.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/util/moeda.dart';
import 'package:quitanda/vm/carrinho.dart';
import 'package:quitanda/vm/catalogo.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carrinho = Provider.of<Carrinho>(context);
    final temItens = carrinho.pedido.itens.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: temItens
          ? carrinhoCheio(context, carrinho.pedido.itens)
          : carrinhoVazio(context),
    );
  }

  Widget carrinhoCheio(BuildContext context, List<ItemPedido> itens) {
    final totalPedido = itens.map((i) => i.total).reduce((a, b) => a + b);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: itens.length,
              itemBuilder: (context, index) => item(context, itens[index]),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
                height: 5,
              ),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Pagar: ${formataMoeda(totalPedido)}"),
            ),
          ),
        ],
      ),
    );
  }

  Widget carrinhoVazio(BuildContext context) => Center(
        child: Text(
          "O carrinho está vazio!",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      );

  Widget item(BuildContext context, ItemPedido item) {
    final temaTexto = Theme.of(context).textTheme;

    return Material(
      elevation: 3,
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
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nome,
                      style: temaTexto.titleLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${item.quantidade} x"),
                          Text(formataMoeda(item.preco)),
                          Text(formataMoeda(item.total)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  final carrinho = Provider.of<Carrinho>(
                    context,
                    listen: false,
                  );
                },
                icon: const Icon(
                  Icons.remove_circle_outline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
