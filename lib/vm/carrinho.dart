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

  void removeItem(String idItem) {
    //quremos descobrir qual o id do produto
    //que se encontra na lista de itens
    //com base no id que recebemos de parametro
    final idProduto = pedido.itens
        .where((i) => i.id == idItem)
        .map((i) => i.produto.id)
        .first;

//consultamos o produto por id na nossa "base fake"
//e fazemos a reposicao do estoque
    final p = _repositorioProduto
        .select()
        .where((i) => i.id == idProduto)
        .first
        .reportEstoque(1);

    _pedido = pedido.removeItem(idItem);

    _repositorioProduto.update(p.id, p);

    notifyListeners();
  }

  void removeTodosItens() {
    final lista = [..._pedido!.itens];

    for (var item in lista) {
      removeItem(item.id);
    }
  }

  void reset() {
    _pedido = Pedido.fromCliente("Anônimo");
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
