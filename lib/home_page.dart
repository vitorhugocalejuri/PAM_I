import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Operation {
  soma,
  subtracao,
  multiplicacao,
  divisao,
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final num1Controller = TextEditingController();
    final num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textField("Num 1", num1Controller),
            textField("Num 2", num2Controller),
            //Soma
            ElevatedButton(
              onPressed: () => soma(
                context,
                num1Controller.text,
                num2Controller.text,
              ),
              child: const Text("Soma"),
            ),
            //Subtração
            ElevatedButton(
              onPressed: () => subtracao(
                context,
                num1Controller.text,
                num2Controller.text,
              ),
              child: const Text("Subtração"),
            ),
          ],
        ),
      ),
    );
  }

  void soma(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);
    final soma = num1 + num2;

    final resposta = "$num1 + $num2 = $soma";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resposta),
      ),
    );
  }

  void subtracao(BuildContext context, String valor1, valor2) {
    final num1 = int.parse(valor1);
    final num2 = int.parse(valor2);
    final subtracao = num1 - num2;

    final resposta = "$num1 - $num2 = $subtracao";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(resposta),
      ),
    );
  }

//Configuração do TextField pra nao precisar repetir codigo
  Widget textField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
