import 'package:atividade/vm/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  "Atividade Avaliativa",
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/esqueci"),
                    child: Text(
                      "Esqueci minha senha",
                      style: linkStyle,
                    ),
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
    final auth = Provider.of<Login>(context, listen: false);

    try {
      auth.login(usuario, senha);

      if (auth.usuarioEstaLogado) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/home",
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
