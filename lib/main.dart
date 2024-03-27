//incompleto
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
    final num1Controller =
    final num2Controller = 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            textField("num1", num1Controller),
            const Text("+"),
            textField("num2", num2Controller),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () => soma(
                  context,
                  num1Controller,
                  num2Controller,
                ),
                child: const Text("Somar!"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void soma(BuildContext context, String value1, value2) {
    int num1 = int.parse(value1);
    int num2 = int.parse(value2);

    final message = "$num1 + $num2 = ${num1 + num2}";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Widget textField(String label, TextEditingController controller) => SizedBox(
        width: 350,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
          ),
        ),
      );
}
