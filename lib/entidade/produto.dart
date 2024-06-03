//final -> é um jeito de declarar variavel, que só pode ser definida 1 vez
//Para inicializar essas variaveis criadas é preciso iniciar todas dentro do
//objeto produto, dentro da propia classe do objeto, observe a baixo.
class Produto {
  final String id;
  final String nome;
  final String categoria;
  final String foto;
  final int estoque;
  final double preco;

  Produto(
      {required this.id,
      required this.nome,
      required this.categoria,
      required this.estoque,
      required this.preco,
      required this.foto});

  bool get temEstoque => estoque > 0;

  bool podeVender(int quantidade) {
    return estoque >= quantidade;
  }

  Produto baixarEstoque(int quantidade) {
    if (!podeVender(quantidade)) {
      throw Exception("Estoque indisponívell!");
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
