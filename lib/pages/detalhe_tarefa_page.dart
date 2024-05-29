import 'package:atividade/entidade/tarefa.dart';
import 'package:atividade/util/data.dart';
import 'package:atividade/util/tema.dart';
import 'package:atividade/vm/gestor_tarefa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetaheTarefaPage extends StatelessWidget {
  const DetaheTarefaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: argument == null
          ? emptyBody(context)
          : body(context, argument as String),
    );
  }

  Widget emptyBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Não foi possível carregar a tarefa. Volte e tente novamente",
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Voltar"),
            ),
          )
        ],
      ),
    );
  }

  Widget body(BuildContext context, String id) {
    final gestor = Provider.of<GestorTarefa>(context);
    final tarefa = gestor.selectById(id);

    if (tarefa == null) {
      return emptyBody(context);
    }

    final temaTexto = temaTextoFrom(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(
                height: 50,
                color: Colors.transparent,
              ),
              Text(
                tarefa.title,
                style: temaTexto.titleLarge,
              ),
              const Divider(
                height: 50,
                color: Colors.transparent,
              ),
              Text(
                tarefa.description,
                style: temaTexto.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Criada em: ${formataDataComHora(tarefa.criadoEm)}",
                style: temaTexto.bodyLarge,
                textAlign: TextAlign.justify,
              ),
              Text(
                "Status: ${tarefa.status}",
                style: temaTexto.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              botaoMoverTarefa(context, tarefa),
            ],
          ),
        ],
      ),
    );
  }

  Widget botaoMoverTarefa(BuildContext context, Tarefa tarefa) {
    final text = getTextoBotao(tarefa);

    if (tarefa.status == "DONE") {
      return const Divider(
        height: 50,
        color: Colors.transparent,
      );
    }

    final gestor = Provider.of<GestorTarefa>(context, listen: false);

    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: () => gestor.move(tarefa.id, tarefa.nextStatus),
        child: Text(text),
      ),
    );
  }

  String getTextoBotao(Tarefa tarefa) {
    switch (tarefa.status) {
      case "TODO":
        return "Por em andamento";
      case "DOING":
        return "Finalizar";
      default:
        return "";
    }
  }
}
