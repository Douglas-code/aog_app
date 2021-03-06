import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MoneyMaskedTextController _gasolinaController = MoneyMaskedTextController();
  MoneyMaskedTextController _alcoolController = MoneyMaskedTextController();
  bool _busy = false;
  bool _completed = false;
  String _resultText = "Compensa utilizar álcool";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        children: <Widget>[
          Logo(),
          _completed
              ? Success(
                  result: _resultText,
                  reset: reset,
                )
              : SubmitForm(
                  gasController: _gasolinaController,
                  alcController: _alcoolController,
                  busy: _busy,
                  submitFunc: calculate,
                ),
        ],
      ),
    );
  }

  Future calculate() {
    double alc = double.parse(
            _alcoolController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;

    double gas = double.parse(
            _gasolinaController.text.replaceAll(new RegExp(r'[,.]'), '')) /
        100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return new Future.delayed(
        const Duration(seconds: 3),
        () => {
              setState(() {
                if (res >= 0.7) {
                  _resultText = "Compensa utilizar Gasolina!";
                } else {
                  _resultText = "Compensa utilizar Ácool!";
                }

                _busy = false;
                _completed = true;
              }),
            });
  }

  reset() {
    setState(() {
      _alcoolController = new MoneyMaskedTextController();
      _gasolinaController = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
    });
  }
}
