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
        preco: 2.41,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Caqui Rama Forte",
        foto:
            "https://api.quitandadivino.com.br/uploads/Untitled_design_1_a38eb4d81f.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 7.99,
      ),
      Produto(
        id: uuid.v4().toString(),
        nome: "Laranja Pera",
        foto:
            "https://api.quitandadivino.com.br/uploads/laranja_98cb512f7a.jpg",
        categoria: "Fruta",
        estoque: 10,
        preco: 6.97,
      ),
    ];
  }
}
