import 'package:intl/intl.dart';

const _dateTimePattern = "dd/MM/yyyy HH:mm:ss";
const _datePattern = "dd/MM/yyyy";

final _formatadorDataHora = DateFormat(_dateTimePattern);
final _formatadorData = DateFormat(_datePattern);

String formataDataComHora(DateTime value) => _formatadorDataHora.format(value);
String formataData(DateTime value) => _formatadorData.format(value);
