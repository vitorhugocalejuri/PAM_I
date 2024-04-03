import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputController = TextEditingController();

  String mensagem = "";
  Color color = Colors.black;

  int? numero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: inputController,
                decoration: const InputDecoration(
                  labelText: "Informe um número par",
                ),
                onChanged: (value) => avalia(value),
              ),
              Text(
                mensagem,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: color,
                    ),
              ),
              Text("dobro: ${(numero ?? 0) * 2}"),
            ],
          ),
        ),
      ),
    );
  }

  void avalia(String valor) {
    //tryParse, tenta fazer o parse de uma string em numero
    //se a string, por exemplo, for "aaa"
    //como não é um número válido, ao inves de gerar erro, ele retorna null
    final numero = int.tryParse(valor);

    setState(() {
      this.numero = numero;
    });

    if (numero == null) {
      //setState é um método que serve para atualizar o estado e causar, por
      //consequencia, uma mudanca/atualização na tela
      setState(() {
        mensagem = "Poderia, ao menos, informar um número, não?";
        color = Colors.purple;
      });
    } else {
      if (numero % 2 == 0) {
        setState(() {
          mensagem = "Obrigado!";
          color = Colors.green;
        });
      } else {
        setState(() {
          mensagem = "Tem certeza que sabe o que é um número par?";
          color = Colors.red;
        });
      }
    }
  }
}
