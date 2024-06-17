import 'dart:math';

import 'package:quitanda/entidade/produto.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final _random = Random();
final _db = <Produto>[
  Produto(
    id: uuid.v4().toString(),
    nome: "Abacate",
    foto: "https://api.quitandadivino.com.br/uploads/abacate_dda94657d2.jpeg",
    categoria: "Fruta",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Abacaxi",
    foto:
        "https://api.quitandadivino.com.br/uploads/Untitled_design_6_6b244ad43d.jpg",
    categoria: "Fruta",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Banana Maçã",
    foto:
        "https://api.quitandadivino.com.br/uploads/Untitled_design_5_cd8cb833f1.jpg",
    categoria: "Fruta",
    estoque: _random.nextInt(20),
    preco: 2.41,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Caqui Rama Forte",
    foto:
        "https://api.quitandadivino.com.br/uploads/Untitled_design_1_a38eb4d81f.jpg",
    categoria: "Fruta",
    estoque: _random.nextInt(20),
    preco: 7.99,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Laranja Pera",
    foto: "https://api.quitandadivino.com.br/uploads/laranja_98cb512f7a.jpg",
    categoria: "Fruta",
    estoque: _random.nextInt(20),
    preco: 1.65,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Acelga",
    foto: "https://api.quitandadivino.com.br/uploads/acelga_697c05cd15.jpg",
    categoria: "Verdura",
    estoque: _random.nextInt(20),
    preco: 1.65,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Alface Americana",
    foto:
        "https://api.quitandadivino.com.br/uploads/alface_americana_6fe7cdeee4.jpg",
    categoria: "Verdura",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Brocolis",
    foto: "https://api.quitandadivino.com.br/uploads/brocolis_44ff6b6454.jpg",
    categoria: "Verdura",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Repolho",
    foto:
        "https://api.quitandadivino.com.br/uploads/Untitled_design_9_a68288edb6.jpg",
    categoria: "Verdura",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Hortelâ",
    foto: "https://api.quitandadivino.com.br/uploads/hortela_ea4161c581.jpg",
    categoria: "Verdura",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Abobrinha do Brasil",
    foto:
        "https://api.quitandadivino.com.br/uploads/abobrinha_brasil_65f41c1408.jpg",
    categoria: "Legume",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Abobrinha do Itália",
    foto:
        "https://api.quitandadivino.com.br/uploads/abobrinha_italia_768673a1f9.jpeg",
    categoria: "Legume",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Abóbora Cambotia",
    foto:
        "https://api.quitandadivino.com.br/uploads/abobora_cambotiam_c9a2ffb89d.jpg",
    categoria: "Legume",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Batata",
    foto: "https://api.quitandadivino.com.br/uploads/batata_6a56d3a2e7.jpg",
    categoria: "Legume",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
  Produto(
    id: uuid.v4().toString(),
    nome: "Batata Doce",
    foto:
        "https://api.quitandadivino.com.br/uploads/batata_doce_29f3d54660.jpg",
    categoria: "Legume",
    estoque: _random.nextInt(20),
    preco: _random.nextDouble() * 3,
  ),
];

class RepositorioProduto {
  var uuid = const Uuid();

  List<Produto> select() {
    return _db;
  }

  Produto update(String id, Produto produto) {
    final posicao = _db.indexWhere((p) => p.id == id);

    if (posicao > -1) {
      _db[posicao] = produto;
    }

    return produto;
  }
}
