import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.red),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = '0';
  String result = '0';
  String expression = '';
  double eqFontSize = 35;
  double reFontSize = 45;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = '0';
        result = '0';
        eqFontSize = 35;
        reFontSize = 45;
      } else if (buttonText == 'DEL') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
        eqFontSize = 45;
        reFontSize = 35;
      } else if (buttonText == '=') {
        eqFontSize = 35;
        reFontSize = 45;

        expression = equation;
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          print(exp);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = e;
        }
      } else {
        eqFontSize = 45;
        reFontSize = 35;
        if (equation == '0') {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttontext, int height, Color buttonColor) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.13 * height,
        color: buttonColor,
        child: FlatButton(
          onPressed: () => buttonPressed(buttontext),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: Colors.black, width: 0.2, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.all(15),
          child: Text(
            buttontext,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(title: Text('Simple Calculator')),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text(
                equation,
                style: TextStyle(color: Colors.black, fontSize: eqFontSize),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text(
                result,
                style: TextStyle(color: Colors.black, fontSize: reFontSize),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Table(
                    children: [
                      TableRow(children: [
                        buildButton('C', 1, Colors.black),
                        buildButton('+/-', 1, Colors.white),
                        buildButton('%', 1, Colors.white),
                        buildButton('DEL', 1, Colors.white)
                      ]),
                      TableRow(children: [
                        buildButton('7', 1, Colors.white),
                        buildButton('8', 1, Colors.white),
                        buildButton('9', 1, Colors.white),
                        buildButton('/', 1, Colors.white)
                      ]),
                      TableRow(children: [
                        buildButton('4', 1, Colors.white),
                        buildButton('5', 1, Colors.white),
                        buildButton('6', 1, Colors.white),
                        buildButton('*', 1, Colors.white)
                      ]),
                      TableRow(children: [
                        buildButton('1', 1, Colors.white),
                        buildButton('2', 1, Colors.white),
                        buildButton('3', 1, Colors.white),
                        buildButton('-', 1, Colors.white)
                      ]),
                      TableRow(children: [
                        buildButton('0', 1, Colors.white),
                        buildButton('.', 1, Colors.white),
                        buildButton('=', 1, Colors.black),
                        buildButton('+', 1, Colors.white)
                      ])
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
