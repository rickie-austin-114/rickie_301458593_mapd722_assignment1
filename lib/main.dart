import 'package:flutter/material.dart';

void main() {
  runApp(PayCalculatorApp());
}

class PayCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PayCalculator(),
    );
  }
}

class PayCalculator extends StatefulWidget {
  @override
  _PayCalculatorState createState() => _PayCalculatorState();
}

class _PayCalculatorState extends State<PayCalculator> {
  final TextEditingController hourlyRateController = TextEditingController();
  final TextEditingController hoursWorkedController = TextEditingController();

  String regularPay = '';
  String overtimePay = '';
  String tax = '';

  void calculatePay() {
    double hourlyRate = double.tryParse(hourlyRateController.text) ?? 0;
    double hoursWorked = double.tryParse(hoursWorkedController.text) ?? 0;

    double regular = 0;
    double overtime = 0;

    if (hoursWorked <= 40) {
      regular = hourlyRate * hoursWorked;
      regularPay = (regular).toStringAsFixed(2);
      overtimePay = '0.00';
      tax = (regular * 0.18).toStringAsFixed(2);
    } else {
      regular = hourlyRate * 40;
      overtime = hourlyRate * (hoursWorked - 40) * 1.5;
      regularPay = regular.toStringAsFixed(2);
      overtimePay = overtime.toStringAsFixed(2);
      tax = ((regular + overtime) * 0.18).toStringAsFixed(2);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Calculator'),
        backgroundColor: Colors.blue, // Set the background color to yellow

      ),
              backgroundColor: Colors.blue, // Set the background color to yellow
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            TextField(
              controller: hourlyRateController,
              decoration: InputDecoration(labelText: 'Hourly Rate'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: hoursWorkedController,
              decoration: InputDecoration(labelText: 'Hours Worked'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculatePay,
              child: Text('Calculate Pay'),
            ),
            SizedBox(height: 20),
            Text('Regular Pay: \$${regularPay}',style: TextStyle(
              color: Colors.brown, // Set the text color to brown
              fontSize: 20, // Optional: set the font size
            ),),
            Text('Overtime Pay: \$${overtimePay}',style: TextStyle(
              color: Colors.brown, // Set the text color to brown
              fontSize: 20, // Optional: set the font size
            ),),
            Text('Tax: \$${tax}',style: TextStyle(
              color: Colors.brown, // Set the text color to brown
              fontSize: 20, // Optional: set the font size
            ),),
            Text('Student ID: 301458593',style: TextStyle(
              color: Colors.brown, // Set the text color to brown
              fontSize: 20, // Optional: set the font size
            ),),
            Text('Student Name: Yeuk Lai Rickie AU',style: TextStyle(
              color: Colors.brown, // Set the text color to brown
              fontSize: 20, // Optional: set the font size
            ),),
          ],
        ),
      ),
    );
  }
}
