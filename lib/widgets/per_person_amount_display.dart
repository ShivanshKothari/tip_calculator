import 'package:flutter/material.dart';

class PerPersonAmountDisplay extends StatelessWidget {
  const PerPersonAmountDisplay({
    super.key,
    required this.theme,
    required this.textStyle,
    required double amountPerPerson,
  }) : _amountPerPerson = amountPerPerson;

  final ThemeData theme;
  final TextStyle textStyle;
  final double _amountPerPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
