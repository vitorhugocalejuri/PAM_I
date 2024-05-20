import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/vm/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = TextEditingController();
    final senhaController = TextEditingController();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            children: [
              const Text(
                "Quitanda",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: "Usuario",
                ),
              ),
              TextField(
                controller: senhaController,
                decoration: const InputDecoration(
                  labelText: "Senha",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 400,
                  child: ElevatedButton(
                    onPressed: () => login(
                      context,
                      usuarioController.text,
                      senhaController.text,
                    ),
                    child: const Text("Entrar"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      "/recuperar-senha",
                    ),
                    child: const Text("Esqueci minha senha"),
                  ),
                  const Text("Cadastrar"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context, String usuario, String senha) {
    final auth = Provider.of<Auth>(context, listen: false);

    try {
      auth.login(usuario, senha);
      if (auth.estaLogado) {
        /*
          Considerando que a navegação em aplicações flutter são
          baseadas em pilha, ou seja:

          tela 2 -------------
          tela 1 -------------
          tela 0 -------------

          ao pressionar o voltar na "tela 2", a tela 2 será fechada
          e a tela 1 vai aparecer, pois ela é a proxima na pilha.

          No nosso caso ao terminar o login, com a navegação "simples",
          teriamos:

          home ------
          login -----

          notem que, apesar da tela home ser a principal do sistema, 
          aindas temos a tela do login na pilha. Dessa forma, ao voltar
          da home, ao inves de sair da aplicação, iríamos para a tela
          de login

          como não queremos isso, usamos o pushNamedAndRemoveUntil para
          abrir a tela home removendo todods que estiveram abaixo
          na pilha.
        */
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/",
          (route) => false,
        );
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
