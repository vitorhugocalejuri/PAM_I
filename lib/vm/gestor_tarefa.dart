import 'package:atividade/entidade/tarefa.dart';
import 'package:atividade/repositorio/repositorio_tarefa.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class GestorTarefa extends ChangeNotifier {
  final _repositorio = RepositorioTarefa();

  void cria(String title, String description) {
    _repositorio.insert(Tarefa(title: title, description: description));
    notifyListeners();
  }

  void move(String id, String status) {
    final tarefa = _repositorio.selectById(id);

    if (tarefa == null) {
      throw Exception("Tarefa não existe");
    }

    if (tarefa.status == "DONE") {
      throw Exception("Não se pode mover uma tarefa concluida!");
    }

    _repositorio.update(tarefa.id, tarefa.move(tarefa.nextStatus));
    notifyListeners();
  }

  List<Tarefa> select() => _repositorio.select();
  Tarefa? selectById(String id) => _repositorio.selectById(id);

  static ChangeNotifierProvider<GestorTarefa> criar() =>
      ChangeNotifierProvider(create: (_) => GestorTarefa());
}
