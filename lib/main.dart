import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Manage the results for each operation
  double sum = 0.0;
  double difference = 0.0;
  double product = 0.0;
  double quotient = 0.0;

  // TextEditingControllers for each operation's input fields
  final TextEditingController addFirstController = TextEditingController();
  final TextEditingController addSecondController = TextEditingController();

  final TextEditingController subFirstController = TextEditingController();
  final TextEditingController subSecondController = TextEditingController();

  final TextEditingController mulFirstController = TextEditingController();
  final TextEditingController mulSecondController = TextEditingController();

  final TextEditingController divFirstController = TextEditingController();
  final TextEditingController divSecondController = TextEditingController();

  void _calculate(String operation) {
    double num1 = double.tryParse(operation == '+' 
        ? addFirstController.text 
        : operation == '-' 
          ? subFirstController.text 
          : operation == '*' 
            ? mulFirstController.text 
            : divFirstController.text) ?? 0;

    double num2 = double.tryParse(operation == '+' 
        ? addSecondController.text 
        : operation == '-' 
          ? subSecondController.text 
          : operation == '*' 
            ? mulSecondController.text 
            : divSecondController.text) ?? 0;

    setState(() {
      switch (operation) {
        case '+':
          sum = num1 + num2;
          break;
        case '-':
          difference = num1 - num2;
          break;
        case '*':
          product = num1 * num2;
          break;
        case '/':
          quotient = num2 != 0 ? num1 / num2 : 0; // Prevent division by zero
          break;
      }
    });
  }

  void _clearInputs() {
    setState(() {
      // Clear all controllers
      addFirstController.clear();
      addSecondController.clear();
      subFirstController.clear();
      subSecondController.clear();
      mulFirstController.clear();
      mulSecondController.clear();
      divFirstController.clear();
      divSecondController.clear();
      
      // Reset all results
      sum = 0.0;
      difference = 0.0;
      product = 0.0;
      quotient = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: addFirstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: addSecondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $sum'), // Display addition result
              IconButton(
                onPressed: () => _calculate('+'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),

          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: subFirstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: subSecondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $difference'), // Display subtraction result
              IconButton(
                onPressed: () => _calculate('-'),
                icon: const Icon(Icons.remove),
              ),
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mulFirstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: mulSecondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $product'), // Display multiplication result
              IconButton(
                onPressed: () => _calculate('*'),
                icon: const Icon(Icons.clear),
              ),
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: divFirstController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: divSecondController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $quotient'), // Display divisionn result
              IconButton(
                onPressed: () => _calculate('/'),
                icon: const Icon(Icons.horizontal_rule),
              ),
            ],
          ),

          // Clear Button
          ElevatedButton(
            onPressed: _clearInputs,
            child: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}
