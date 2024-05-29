import 'package:atividade/entidade/tarefa.dart';

class RepositorioTarefa {
  void insert(Tarefa tarefa) {
    _tarefasDB.add(tarefa);
  }

  void update(String id, Tarefa tarefa) {
    var index = _tarefasDB.indexWhere((t) => t.id == id);

    if (index > -1) {
      _tarefasDB[index] = tarefa;
    }
  }

  List<Tarefa> select() {
    return List.from(_tarefasDB);
  }

  Tarefa? selectById(String id) =>
      _tarefasDB.where((t) => t.id == id).firstOrNull;
}

final _tarefasDB = <Tarefa>[
  Tarefa.historico(
    title: "Executar Atividade",
    description:
        "Realizar a atividade referente a semana de avaliações na Etec Sylvio de Mattos Carvalho",
    criadoEm: DateTime.now().subtract(const Duration(days: 5)),
    status: "TODO",
  ),
  Tarefa.historico(
    title: "Festa Junina",
    description:
        "Preparar e realizar atividades que nos permitam estar em condições para que a Festa Junina da Etec Sylvio de Mattos Carvalho",
    criadoEm: DateTime.now().subtract(const Duration(days: 3)),
    status: "TODO",
  ),
  Tarefa.historico(
    title: "Feriado",
    description: "Realizar atividades pendentes para organizar o calendário",
    criadoEm: DateTime.now().subtract(const Duration(days: 3)),
    status: "TODO",
  ),
];
