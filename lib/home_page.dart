import 'package:flutter/material.dart';
import 'package:listagem/repositorio_produto.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repositorio = RepositorioProduto();
    final produtos = repositorio.select();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista da quitanda"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      //ListView.builder cria uma lista baseada em conteudo
      //dinamico
      //
      //o atributo itemCount, estabelece quantos itens devem
      //ter na ListView e deve estar associadaa quantidade
      //real de elementos que se deseja apresentar
      //
      //o atributo itemBuilder, estabelece uma receita
      //para criar um Widget que represente o item da lista
      //ela será invocada tantas vezes quanto for estabelecido
      //no atributo itemCount
      body: ListView.builder(
        padding: const EdgeInsets.all(4),
        itemCount: produtos.length,
        itemBuilder: (contetx, index) => Item(
          //produtos[index]retorna o produto que se encontra
          //na posicao estabelecida pela variável index
          nome: produtos[index].nome,
          categoria: produtos[index].categoria,
        ),
      ),
      // body: ListView(
      //   padding: const EdgeInsets.all(4),
      //   children: const [
      //     Item(nome: "Abacate", categoria: "Fruta"),
      //     Item(nome: "Abacaxi", categoria: "Fruta"),
      //     Item(nome: "Maçã", categoria: "Fruta"),
      //     Item(nome: "Pera", categoria: "Fruta"),
      //     Item(nome: "Uva", categoria: "Fruta"),
      //     Item(nome: "Pepino", categoria: "Legume"),
      //     Item(nome: "Alface", categoria: "Hortaliça"),
      //     Item(nome: "Tomate", categoria: "Fruta"),
      //   ],
      // ),
    );
  }
}

class Item extends StatelessWidget {
  final String nome;
  final String categoria;

  const Item({
    super.key,
    required this.nome,
    required this.categoria,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.store,
              size: 40,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: textTheme.bodyLarge,
              ),
              Text(
                categoria,
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
