import 'package:flutter/material.dart';
import 'package:quitanda/pages/home_page.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routes: {
        "/": (context) => const HomePage(),
      },
      initialRoute: "/",
    );
  }
}
