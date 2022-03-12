import 'package:flutter/material.dart';

void main() => runApp(const calculator());

class calculator extends StatelessWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  double n1 = 0;
  double n2 = 0;
  dynamic equal = '';
  dynamic fin = '';
  dynamic operation = '';
  dynamic oprt = '';
  dynamic calctxt = '0';
  Widget button(number, Color color) {
    return Container(
        padding: const EdgeInsets.only(bottom: 2, right: 2),
        width: 98,
        height: 90.0,
        child: RaisedButton(
          child: Text(number,
              style: const TextStyle(
                fontSize: 38,
                color: Colors.white,
              )),
          onPressed: () {
            calculation(number);
          },
          color: color,
        ));
  }

  Widget buttonNol(number, Color color) {
    return Container(
        padding: const EdgeInsets.only(bottom: 2, right: 2),
        width: 196.0,
        height: 90.0,
        child: RaisedButton(
          child: Text(number,
              style: const TextStyle(
                fontSize: 38,
                color: Colors.white,
              )),
          onPressed: () {
            calculation(number);
          },
          color: color,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        backgroundColor: const Color.fromARGB(255, 27, 27, 27),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    calctxt,
                    style: const TextStyle(color: Colors.white, fontSize: 50),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                button('C', const Color.fromARGB(255, 80, 80, 80)),
                button('⁺⁄-', const Color.fromARGB(255, 80, 80, 80)),
                button('%', const Color.fromARGB(255, 80, 80, 80)),
                button('÷', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                button('7', const Color.fromARGB(255, 129, 128, 128)),
                button('8', const Color.fromARGB(255, 129, 128, 128)),
                button('9', const Color.fromARGB(255, 129, 128, 128)),
                button('x', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                button('4', const Color.fromARGB(255, 129, 128, 128)),
                button('5', const Color.fromARGB(255, 129, 128, 128)),
                button('6', const Color.fromARGB(255, 129, 128, 128)),
                button('–', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                button('1', const Color.fromARGB(255, 129, 128, 128)),
                button('2', const Color.fromARGB(255, 129, 128, 128)),
                button('3', const Color.fromARGB(255, 129, 128, 128)),
                button('+', Colors.orange),
              ],
            ),
            Row(
              children: <Widget>[
                buttonNol('0', const Color.fromARGB(255, 129, 128, 128)),
                button('.', const Color.fromARGB(255, 129, 128, 128)),
                button('=', Colors.orange),
              ],
            ),
          ],
        ));
  }

  void calculation(number) {
    if (number == 'C') {
      calctxt = '0';
      n1 = 0;
      n2 = 0;
      equal = '';
      fin = '';
      operation = '';
      oprt = '';
    } else if (operation == '=' && number == '=') {
      if (oprt == '+') {
        fin = add();
      } else if (oprt == '–') {
        fin = min();
      } else if (oprt == 'x') {
        fin = multipl();
      } else if (oprt == '÷') {
        fin = div();
      }
    } else if (number == '+' ||
        number == '–' ||
        number == '÷' ||
        number == 'x' ||
        number == '=') {
      if (n1 == 0) {
        n1 = double.parse(equal);
      } else {
        n2 = double.parse(equal);
      }
      if (operation == '+') {
        fin = add();
      } else if (operation == '–') {
        fin = min();
      } else if (operation == 'x') {
        fin = multipl();
      } else if (operation == '÷') {
        fin = div();
      }
      oprt = operation;
      operation = number;
      equal = '';
    } else if (number == '%') {
      equal = (n1 / 100).toString();
      fin = equal;
    } else if (number == '.') {
      if (!equal.toString().contains('.')) {
        equal = equal.toString() + '.';
      }
      fin = equal;
    } else if (number == '⁺⁄-') {
      if (equal.toString().startsWith('–')) {
        equal = equal.toString().substring(1);
      } else {
        equal = '–' + equal.toString();
      }
      fin = equal;
    } else {
      equal = equal + number;
      fin = equal;
    }
    setState(() {
      calctxt = fin;
    });
  }

  String add() {
    equal = (n1 + n2).toString();
    n1 = double.parse(equal);
    return equal;
  }

  String min() {
    equal = (n1 - n2).toString();
    n1 = double.parse(equal);
    return equal;
  }

  String multipl() {
    equal = (n1 * n2).toString();
    n1 = double.parse(equal);
    return equal;
  }

  String div() {
    equal = (n1 / n2).toString();
    n1 = double.parse(equal);
    return equal;
  }
}
