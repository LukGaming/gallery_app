import 'package:flutter/material.dart';
import 'package:gallery_app/my_app.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');

  runApp(const MyApp());
}
