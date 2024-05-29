import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class Tarefa {
  final String id;
  final String title;
  final String description;
  final DateTime criadoEm;
  DateTime? concluidoEm;
  final String status;

  Tarefa({
    required this.title,
    required this.description,
  })  : id = _uuid.v4(),
        criadoEm = DateTime.now(),
        status = "TODO";

  Tarefa.historico({
    required this.title,
    required this.description,
    required this.criadoEm,
    required this.status,
  }) : id = _uuid.v4();

  Tarefa._({
    required this.id,
    required this.title,
    required this.description,
    required this.criadoEm,
    required this.concluidoEm,
    required this.status,
  });

  Tarefa move(String status) => Tarefa._(
        id: id,
        title: title,
        description: description,
        criadoEm: criadoEm,
        concluidoEm: concluidoEm,
        status: status,
      );

  String get nextStatus {
    switch (status) {
      case "TODO":
        return "DOING";
      case "DOING":
        return "DONE";
      default:
        return "UNKNOWN";
    }
  }
}
