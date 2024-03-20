import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Seja Bem Vindo!"),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "/menu"),
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
