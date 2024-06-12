import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quitanda/vm/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final usuarioController = TextEditingController();
    final senhaController = TextEditingController();

    final linkStyle = textTheme.bodyMedium?.copyWith(
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Quitanda",
                  style: textTheme.headlineLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
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
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: ElevatedButton(
                  onPressed: () => login(
                    context,
                    usuarioController.text,
                    senhaController.text,
                  ),
                  child: const Text("Entrar"),
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
                    child: Text(
                      "Esqueci minha senha",
                      style: linkStyle,
                    ),
                  ),
                  Text(
                    "Cadastrar",
                    style: linkStyle,
                  ),
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
        * considerando que a navegação em aplicações flutter são 
        * baseadas em pilha, ou seja:
        *
        * tela 2 ------------
        * tela 1 ------------
        * tela 0 ------------
        *
        * ao pressionar o voltar na "tela 2", a tela 2 será fechada
        * e a tela 1 vai aparecer, pois ela é a próxima na pilha.
        *
        * No nosso caso ao terminar o login, com a navegação "simples",
        * teriamos:
        *
        * home  ------
        * login ------
        *
        * notem que, apesar da tela home ser a principal do sistema,
        * ainda temos a tela do login na pilha. Dessa forma, ao voltar
        * da home, ao invés de sair da aplicação, iríamos para a tela
        * de login...
        *
        * como não queremos isso, usamos o pushNamedAndRemoveUntil para
        * abrir a tela home removendo todos que estiverem abaixo 
        * na pilha
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
