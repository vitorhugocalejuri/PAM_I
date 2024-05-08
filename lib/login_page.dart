import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

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
                controller: controller,
                decoration: const InputDecoration(
                  labelText: "Usuário:",
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Senha:"),
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
}
