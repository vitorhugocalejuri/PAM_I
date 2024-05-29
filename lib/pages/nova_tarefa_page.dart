import 'package:atividade/vm/gestor_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NovaTarefaPage extends StatelessWidget {
  const NovaTarefaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tituloController = TextEditingController();
    final descricaoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Tarefa"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(6),
          width: 450,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              textField("Titulo", tituloController),
              textField("Descrição", descricaoController),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () => adicionar(
                    context,
                    tituloController.text,
                    descricaoController.text,
                  ),
                  child: const Text("Adicionar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void adicionar(BuildContext context, String titulo, String descricao) {
    final criador = Provider.of<GestorTarefa>(context, listen: false);
    criador.cria(titulo, descricao);

    Navigator.pop(context);
  }

  Widget textField(String label, TextEditingController controller) => TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
      );
}
