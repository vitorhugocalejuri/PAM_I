import 'package:quitanda/entidade/produto.dart';

class ItemPedido {
  final String nome;
  final double preco;
  final int quantidade;
  final Produto produto;

  ItemPedido._({
    required this.nome,
    required this.preco,
    required this.quantidade,
    required this.produto,
  });

  factory ItemPedido.fromProduto(Produto produto) {
    return ItemPedido._(
      nome: produto.nome,
      preco: produto.preco,
      quantidade: 1,
      produto: produto,
    );
  }

  factory ItemPedido.fromProdutoPreco(
    Produto produto,
    double preco,
    int quantidade,
  ) {
    return ItemPedido._(
      nome: produto.nome,
      preco: preco,
      quantidade: quantidade,
      produto: produto,
    );
  }

  ItemPedido adiciona(int quantidade) {
    if (produto.estoque >= this.quantidade + quantidade) {
      return ItemPedido._(
        nome: nome,
        preco: preco,
        quantidade: this.quantidade + quantidade,
        produto: produto,
      );
    }
    throw Exception("Não há estoque suficiente!");
  }

  ItemPedido remove(int quantidade) {
    if (this.quantidade - quantidade >= 0) {
      return ItemPedido._(
        nome: nome,
        preco: preco,
        quantidade: this.quantidade - quantidade,
        produto: produto,
      );
    }

    throw Exception("Quantidade não pode ser negativa!");
  }
}
