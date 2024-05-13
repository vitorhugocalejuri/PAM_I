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
      appBar: AppBar(),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              const Text(
                "Quitanda",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
              ),
              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(
                  labelText: "Usuário:",
                ),
              ),
              TextField(
                controller: senhaController,
                decoration: const InputDecoration(labelText: "Senha:"),
              ),
              Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(" Entar"),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Esqueci a Senha"),
                  Text("Cadastrar"),
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
      /* 
        considerando que a nevegação em aplicações flutter são
        baseadas em pilha, ou seja:

        tela 2 ----------
        tela 1 ----------
        tela 0 ---------- 

        ao pressionar o voltar na tela 2, tela 2 será fechada 
        e a tela 1 vai aparecer, pois ela é a próxima na pilha.

        No nosso caso ao terminar o login, com a navegação "simples",
        teriamos:

        home  ------
        login ------

        notem que, apesar da tela home ser a principal do sistema,
        ainda temos a tela do login na pilha. Dessa forma, ao voltar
        de home, ao invés de sair da aplicação, iríamos para a tela
        de login...

        como não queremos isso, usuamos o pushNamedAndRemoveUntil para
        abrir a tela do home removendo todos que estiverem abaixo
        na pilha
        */
      if (auth.estaLogado) {
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
