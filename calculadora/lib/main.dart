import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: const CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({Key? key}) : super(key: key);

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _output = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '';
      } else if (buttonText == '=') {
      } else {
        _output += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                _output,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                _buildButton('7', buttonColor: Colors.blueGrey),
                _buildButton('8', buttonColor: Colors.blueGrey),
                _buildButton('9', buttonColor: Colors.blueGrey),
                _buildButton('/', buttonColor: Colors.blue),
              ],
            ),
            Row(
              children: [
                _buildButton('4', buttonColor: Colors.blueGrey),
                _buildButton('5', buttonColor: Colors.blueGrey),
                _buildButton('6', buttonColor: Colors.blueGrey),
                _buildButton('*', buttonColor: Colors.blue),
              ],
            ),
            Row(
              children: [
                _buildButton('1', buttonColor: Colors.blueGrey),
                _buildButton('2', buttonColor: Colors.blueGrey),
                _buildButton('3', buttonColor: Colors.blueGrey),
                _buildButton('-', buttonColor: Colors.blue),
              ],
            ),
            Row(
              children: [
                _buildButton('C', buttonColor: Colors.red),
                _buildButton('0', buttonColor: Colors.blueGrey),
                _buildButton('=', buttonColor: Colors.green),
                _buildButton('+', buttonColor: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String buttonText, {Color buttonColor = Colors.blue}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            _onButtonPressed(buttonText);
          },
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, color: Colors.white),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
            elevation: MaterialStateProperty.all<double>(0),
            minimumSize: MaterialStateProperty.all<Size>(const Size(80, 80)),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(20)),
            textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 30)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
