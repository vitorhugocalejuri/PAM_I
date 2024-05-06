import 'package:flutter/foundation.dart';
import 'package:quitanda/entidade/produto.dart';

class Catalogo extends ChangeNotifier {
  final List<Produto> produtos;

  Catalogo({
    required this.produtos,
  });

  Produto findById(String id) {
    return produtos.where((p) => p.id == id).first;
  }
}
