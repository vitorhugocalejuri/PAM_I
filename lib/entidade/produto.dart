class Produto {
  final String id;
  final String nome;
  final String foto;
  final String categoria;
  final int estoque;
  final double preco;

  Produto({
    required this.id,
    required this.nome,
    required this.foto,
    required this.categoria,
    required this.estoque,
    required this.preco,
  });

  bool get temEstoque => estoque > 0;

  bool podeVender(int quantidade) {
    return estoque >= quantidade;
  }

  Produto baixarEstoque(int quantidade) {
    if (!podeVender(quantidade)) {
      throw Exception("Estoque indisponível!");
    }

    return Produto(
      id: id,
      nome: nome,
      foto: foto,
      categoria: categoria,
      estoque: estoque - quantidade,
      preco: preco,
    );
  }
}
