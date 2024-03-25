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
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Olá, qual seu nome?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "Nome:",
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () => cumprimenta(context, controller),
                child: const Text("OK"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void cumprimenta(BuildContext context, TextEditingController controller) {
    final nome = controller.text;
    final mensagem = "Olá, $nome!";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }
}
