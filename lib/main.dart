import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alcool ou Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  MoneyMaskedTextController _gasolinaController = MoneyMaskedTextController();
  MoneyMaskedTextController _alcoolController = MoneyMaskedTextController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          Success(
            result: "Compensa utilizar X",
            reset: () {},
          ),
          Input(
            controller: _gasolinaController,
            label: "Gasolina",
          ),
          Input(
            controller: _alcoolController,
            label: "Álcool",
          ),
          LoadingButton(
            busy: false,
            invert: false,
            func: () {},
            text: "CALCULAR",
          ),
        ],
      ),
    );
  }
}
