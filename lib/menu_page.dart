import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final inputController = TextEditingController();

  String numero = "";

  @override
  Widget build(BuildContext context) {
    inputController.addListener(
      () => setState(() {
        numero = inputController.text;
      }),
    );

    String mensagem;
    var num = int.tryParse(numero);

    if (num == null) {
      mensagem = "Informe pelo menos um número, ne...";
    } else if (num % 2 == 0) {
      mensagem = "Obrigado!";
    } else {
      mensagem = "Você sabe o que é um número par?";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Informe um número par",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
