import 'package:flutter/material.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/util/moeda.dart';

class ProdutoItemList extends StatelessWidget {
  final Produto produto;

  const ProdutoItemList({
    super.key,
    required this.produto,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              produto.nome,
              style: textTheme.bodyLarge,
            ),
            Text(
              produto.categoria,
              style: textTheme.bodySmall,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(formataMoeda(produto.preco)),
            Text(
              "${produto.estoque}",
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
