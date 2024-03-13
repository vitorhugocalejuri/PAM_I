import 'package:flutter/material.dart';

void main() => runApp(const Aplicacao());

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
              CrossAxisAlignment.start, // inverte as posições das coisas
          children: [
            Text("Atividade"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome: Vitor Hugo Calejuri"),
                Text("Email: vinicius.oliveirau53@etec.sp.gov.br"),
                Text("idade: 123"),
              ],
            ),
            Center(
              child: Text("13/03/2024"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("2H3"),
                Text("Matão"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
