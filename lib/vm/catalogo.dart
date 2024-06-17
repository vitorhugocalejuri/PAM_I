import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/entidade/produto.dart';
import 'package:quitanda/repositorio/repositorio_produto.dart';

class Catalogo extends ChangeNotifier {
  final List<Produto> produtos;

  Catalogo({
    required this.produtos,
  });

  Future<List<String>> findCategorias() async {
    final stream =
        Stream.fromIterable(produtos.map((p) => p.categoria)).distinct();

    return await stream.toList();
  }

  List<Produto> findByCategoria(String categoria) {
    return produtos.where((p) => p.categoria == categoria).toList();
  }

  Produto findById(String id) {
    return produtos.where((p) => p.id == id).first;
  }

  Produto findByMaiorEstoque() {
    var items = [...produtos];

    items.sort((a, b) => b.estoque.compareTo(a.estoque));
    return items.first;
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
