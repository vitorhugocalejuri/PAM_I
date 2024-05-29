import 'package:atividade/components/tarefa_list_item.dart';
import 'package:atividade/vm/gestor_tarefa.dart';
import 'package:atividade/vm/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final gestorTarefa = Provider.of<GestorTarefa>(context);
    final login = Provider.of<Login>(context);

    final tarefas = gestorTarefa.select();

    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: tema.colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.maxFinite,
            color: tema.colorScheme.tertiary,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(
              bottom: 20,
              top: 8,
              left: 8,
              right: 8,
            ),
            child: Text(
              "Seja bem vindo, ${login.usuarioLogado?.nome ?? "Anônimo"}!",
              style: tema.textTheme.bodyLarge?.copyWith(
                color: tema.colorScheme.onTertiary,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(
                  context,
                  "/detalhe",
                  arguments: tarefas[index].id,
                ),
                child: TarefaListItem(tarefa: tarefas[index]),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: tarefas.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/nova"),
        child: const Icon(Icons.add),
      ),
    );
  }
}
