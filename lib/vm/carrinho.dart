import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/item_pedido.dart';
import 'package:quitanda/entidade/pedido.dart';
import 'package:quitanda/entidade/produto.dart';

class Carrinho extends ChangeNotifier {
  Pedido? _pedido;

  void adicionaItem(Produto produto) {
    _pedido = pedido.adicionaItem(
      ItemPedido.fromProduto(produto),
    );

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
