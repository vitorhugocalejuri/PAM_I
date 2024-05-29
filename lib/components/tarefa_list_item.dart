import 'package:atividade/entidade/tarefa.dart';
import 'package:atividade/util/data.dart';
import 'package:flutter/material.dart';

class TarefaListItem extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaListItem({
    super.key,
    required this.tarefa,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tarefa.title,
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                tarefa.description,
                style: textTheme.bodySmall,
              ),
            ),
            Text(
              "Data: ${formataData(tarefa.criadoEm)}",
              style: textTheme.bodySmall,
            ),
            Text(
              "Status: ${tarefa.status}",
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
