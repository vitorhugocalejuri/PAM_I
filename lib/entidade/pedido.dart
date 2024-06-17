import 'package:quitanda/entidade/item_pedido.dart';

class Pedido {
  final String nomeCliente;
  final List<ItemPedido> itens;

  Pedido._({
    required this.nomeCliente,
    required this.itens,
  });

  factory Pedido.fromCliente(String nomeCliente) {
    return Pedido._(nomeCliente: nomeCliente, itens: []);
  }

  factory Pedido.fromDB(
    String nomeCliente,
    List<ItemPedido> itens,
  ) {
    return Pedido._(nomeCliente: nomeCliente, itens: itens);
  }

  Pedido adicionaItem(ItemPedido item) {
    var novoItens = [...itens];
    novoItens.add(item);

    return Pedido._(
      nomeCliente: nomeCliente,
      itens: novoItens,
    );
  }

  Pedido removeItem(String idItem) {
    final lista = [...itens];
    lista.removeWhere((i) => i.id == idItem);

    return Pedido._(
      nomeCliente: nomeCliente,
      itens: lista,
    );
  }

  double get total => itens
      .map((i) => i.preco * i.quantidade)
      .reduce((value, element) => value + element);

  int get quantidade => itens.isNotEmpty
      ? itens
          .map((i) => i.quantidade)
          .reduce((value, element) => value + element)
      : 0;
}
