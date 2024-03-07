import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tip_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TipBaba',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TipBaba(),
    );
  }
}

class TipBaba extends StatefulWidget {
  const TipBaba({super.key});

  @override
  State<TipBaba> createState() => _TipBabaState();
}

class _TipBabaState extends State<TipBaba> {
  double _billAmount = 0;
  double _tipAmount = 0;
  double _tipFactor = 0;
  int _peopleCount = 1;
  double _amountPerPerson = 0;

  void incrementPeople() {
    setState(() {
      _peopleCount++;
      _amountPerPerson = _billAmount / _peopleCount + _tipAmount;
    });
  }

  void decrementPeople() {
    setState(() {
      if (_peopleCount > 1) {
        _peopleCount--;
        _amountPerPerson = _billAmount / _peopleCount + _tipAmount;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final textStyle = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tip Baba'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: theme.colorScheme.inversePrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Amount per person',
                    style: textStyle.copyWith(
                        fontSize: theme.textTheme.headlineLarge!.fontSize),
                  ),
                  Text(
                    '₹ ${_amountPerPerson.toStringAsFixed(2)}',
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                      color: theme.colorScheme.primary,
                      style: BorderStyle.solid,
                      width: 2)),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      setState(() {
                        _billAmount = double.parse(value);
                        _amountPerPerson =
                            _billAmount / _peopleCount + _tipAmount;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      labelText: 'Bill Amount',
                    ),
                  ),
                  PersonCounter(
                    textStyle: textStyle,
                    peopleCount: _peopleCount,
                    onIncrement: incrementPeople,
                    onDecrement: decrementPeople,
                  ),
                  TipCounter(
                    textStyle: textStyle,
                    tipAmount: _tipAmount,
                    tipFactor: _tipFactor,
                    onChanged: (double value) {
                      setState(() {
                        _tipFactor = value;
                        _tipAmount = _billAmount * _tipFactor;
                        _amountPerPerson =
                            _billAmount / _peopleCount + _tipAmount;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
