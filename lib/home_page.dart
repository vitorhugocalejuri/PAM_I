import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final senhaController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: "Usuário",
              ),
            ),
            TextField(
              controller: senhaController,
              decoration: const InputDecoration(
                labelText: "Senha",
              ),
              obscureText: true,
              autocorrect: false,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () => doLogin(
                  context,
                  usuarioController.text,
                  senhaController.text,
                ),
                child: const Text("Entrar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void doLogin(BuildContext context, String usuario, String senha) {
    String mensagem;
    if (usuario == "admin" && senha == "102030") {
      mensagem = "Seja bem vindo, Administrador!";
    } else {
      mensagem = "Credenciais inválidas!";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
      ),
    );
  }
}


/*No flutter, estado se refere a qualque conjutos de dados que pode mudar ao longo do tempo e afeta a interface do usuário*/