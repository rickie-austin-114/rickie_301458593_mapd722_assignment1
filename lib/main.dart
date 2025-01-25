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
  String totalPay = '';
  String tax = '';
  String error_message = '';

  void calculatePay() {
    double hourlyRate = double.tryParse(hourlyRateController.text) ?? -1;
    double hoursWorked = double.tryParse(hoursWorkedController.text) ?? -1;

    double regular = 0;
    double overtime = 0;

    if (hoursWorked < 0 ||
        hourlyRate < 0 ||
        hoursWorked >
            140 || // we assume that it is impossible to work more than 20 hours a day. Hence, the maximum number of hours per week is 140
        hourlyRate >
            200000) // hourly rate of elon musk is just $192307, so we reject hourly rate of >$200000
    {
      error_message = "Invalid input";
    } else if (hoursWorked <= 40) {
      regular = hourlyRate * hoursWorked;
      regularPay = (regular).toStringAsFixed(2);
      overtimePay = '0.00';
      totalPay = (regular).toStringAsFixed(2);
      tax = (regular * 0.18).toStringAsFixed(2);
      error_message = "";
    } else {
      regular = hourlyRate * 40;
      overtime = hourlyRate * (hoursWorked - 40) * 1.5;
      regularPay = regular.toStringAsFixed(2);
      overtimePay = overtime.toStringAsFixed(2);
      totalPay = (regular + overtime).toStringAsFixed(2);
      tax = ((regular + overtime) * 0.18).toStringAsFixed(2);
      error_message = "";
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
            Text(
              'Regular Pay: \$${regularPay}',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            Text(
              'Overtime Pay: \$${overtimePay}',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            Text(
              'Total Pay (before tax): \$${totalPay}',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            Text(
              'Tax: \$${tax}',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            Text(
              '${error_message}',
              style: TextStyle(
                color: Colors.red, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Student ID: 301458593',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
            Text(
              'Student Name: Yeuk Lai Rickie AU',
              style: TextStyle(
                color: Colors.brown, // Set the text color to brown
                fontSize: 20, // Optional: set the font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
