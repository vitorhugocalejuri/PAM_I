import 'package:atividade/vm/senha.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class EsqueciSenhaPage extends StatelessWidget {
  const EsqueciSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<Senha>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: vm.avisado ? foiAvisado() : naoFoiAvisado(context),
    );
  }

  Widget naoFoiAvisado(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final vm = Provider.of<Senha>(context, listen: false);

      if (!vm.avisado) {
        Future.delayed(const Duration(seconds: 5), () {
          Navigator.pop(context);
          vm.marcaComoAvisado();
        });
      }
    });

    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Vou te avisar somente uma vez!"),
          Text("Preste bastante atenção!"),
          Divider(
            height: 80,
            color: Colors.transparent,
          ),
          Text("usuario: aluno"),
          Text("senha: 1234546"),
          Divider(
            height: 80,
            color: Colors.transparent,
          ),
          Text("Lembre-se, você foi avisado!"),
        ],
      ),
    );
  }

  Widget foiAvisado() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Eu disse que você foi avisado!"),
          Divider(
            height: 80,
            color: Colors.transparent,
          ),
          Text("Preste mais atenção na próxima vez!"),
        ],
      ),
    );
  }
}
