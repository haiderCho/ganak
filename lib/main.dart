import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      theme: ThemeData.dark(),
      home: CalculatorHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = '0';
  String _input = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _output = '0';
        _input = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (value == '+' || value == '-' || value == '×' || value == '÷') {
        _num1 = double.tryParse(_output) ?? 0;
        _operand = value;
        _input = '';
      } else if (value == '=') {
        _num2 = double.tryParse(_input) ?? 0;
        switch (_operand) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '×':
            _output = (_num1 * _num2).toString();
            break;
          case '÷':
            _output = _num2 != 0 ? (_num1 / _num2).toString() : 'Error';
            break;
        }
        _input = _output;
        _operand = '';
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _buttonPressed(text),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(_output, style: TextStyle(fontSize: 48)),
          ),
          Divider(),
          Expanded(
            child: Column(
              children: [
                Row(children: [_buildButton('7'), _buildButton('8'), _buildButton('9'), _buildButton('÷')]),
                Row(children: [_buildButton('4'), _buildButton('5'), _buildButton('6'), _buildButton('×')]),
                Row(children: [_buildButton('1'), _buildButton('2'), _buildButton('3'), _buildButton('-')]),
                Row(children: [_buildButton('C'), _buildButton('0'), _buildButton('='), _buildButton('+')]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// This is a simple calculator app built with Flutter.
// It supports basic arithmetic operations: addition, subtraction, multiplication, and division.