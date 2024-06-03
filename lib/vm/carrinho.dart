import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/item_pedido.dart';
import 'package:quitanda/entidade/pedido.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/repositorio/repositorio_produto.dart';

class Carrinho extends ChangeNotifier {
  final _repositorioProduto = RepositorioProduto();

  Pedido? _pedido;

  void adicionaItem(Produto produto) {
    final p = produto.baixarEstoque(1);

    _pedido = pedido.adicionaItem(
      ItemPedido.fromProduto(produto),
    );

    _repositorioProduto.update(p.id, p);

    notifyListeners();
  }

  Pedido get pedido {
    _pedido ??= Pedido.fromCliente("Anônimo");

    return _pedido!;
  }

  static ChangeNotifierProvider<Carrinho> create() => ChangeNotifierProvider(
        create: (_) => Carrinho(),
      );
}
