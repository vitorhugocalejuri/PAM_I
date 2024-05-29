import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Senha extends ChangeNotifier {
  bool _avisado = false;

  void marcaComoAvisado() {
    if (_avisado) {
      return;
    }

    _avisado = true;
    notifyListeners();
  }

  bool get avisado => _avisado;

  static ChangeNotifierProvider<Senha> criar() =>
      ChangeNotifierProvider(create: (_) => Senha());
}
