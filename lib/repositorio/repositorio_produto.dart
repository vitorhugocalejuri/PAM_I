import 'package:quitanda/entidade/produto.dart';
import 'package:uuid/uuid.dart';

class RepositorioProduto {
  var uuid = const Uuid();
  List<Produto> select() {
    return <Produto>[
      Produto(
        id: uuid.v4().toString(),
        nome: "Abacate",
        foto:
            "https://api.quitandadivino.com.br/uploads/abacate_dda94657d2.jpeg",
        categoria: "Fruta",
        estoque: 10,
        preco: 6.97,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Abacaxi",
        foto:
            "https://api.quitandadivino.com.br/uploads/Untitled_design_6_6b244ad43d.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 12.99,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Banana Maçã",
        foto:
            "https://api.quitandadivino.com.br/uploads/Untitled_design_5_cd8cb833f1.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 12.99,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Coco Fresco Pedaços",
        foto:
            "https://api.quitandadivino.com.br/uploads/Untitled_design_20_d2ea0773e6.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 14.99,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Goiaba",
        foto: "https://api.quitandadivino.com.br/uploads/goiaba_a9b8dfe8be.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 7.99,
      ),
    ];
  }
}
