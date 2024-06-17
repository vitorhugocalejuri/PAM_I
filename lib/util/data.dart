import 'package:intl/intl.dart';

final _formatadorData = DateFormat("dd/MM/yyyy HH:mm:ss");

String formataData(DateTime value) {
  return _formatadorData.format(value);
}
