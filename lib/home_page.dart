import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';
  Color _resultColor = Colors.black;

  void _calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);
    double bmi = weight / (height * height);

    setState(() {
      if (bmi < 18.5) {
        _result = 'Underweight';
        _resultColor = Colors.yellow; // Change based on class
      } else if (bmi >= 18.5 && bmi <= 25) {
        _result = 'Normal';
        _resultColor = Colors.green;
      } else {
        _result = 'Overweight';
        _resultColor = Colors.red; // Change based on class
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (m)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _calculateBMI, child: Text('Calculate')),
            SizedBox(height: 20),
            Text(
              'Category: $_result',
              style: TextStyle(color: _resultColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
