import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista da quitanda"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(4),
        children: const [
          Item(nome: "Abacate", categoria: "Fruta"),
          Item(nome: "Abacaxi", categoria: "Fruta"),
          Item(nome: "Maçã", categoria: "Fruta"),
          Item(nome: "Pera", categoria: "Fruta"),
          Item(nome: "Uva", categoria: "Fruta"),
          Item(nome: "Pepino", categoria: "Legume"),
          Item(nome: "Alface", categoria: "Verdura"),
          Item(nome: "Tomate", categoria: "Fruta"),
        ],
      ),
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
    return Row(
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
            Text(nome),
            Text(categoria),
          ],
        ),
      ],
    );
  }
}
