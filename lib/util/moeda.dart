import 'package:intl/intl.dart';

final _formatador = NumberFormat.currency(
  locale: "pt_BR",
  symbol: "R\$",
);

String formataMoeda(double value) => _formatador.format(value);