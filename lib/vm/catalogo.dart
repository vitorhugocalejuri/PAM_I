import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/repositorio/repositorio_produto.dart';

class Catalogo extends ChangeNotifier {
  final List<Produto> produtos;

  Catalogo({
    required this.produtos,
  });

  Produto findById(String id) {
    return produtos.where((p) => p.id == id).first;
  }

  Produto findByMaiorEstoque() {
    produtos.sort((a, b) => b.estoque.compareTo(a.estoque));
    return produtos.first;
  }

  static ChangeNotifierProvider<Catalogo> create(
      RepositorioProduto repositorio) {
    return ChangeNotifierProvider(
      create: (_) => Catalogo(
        produtos: repositorio.select(),
      ),
    );
  }
}
