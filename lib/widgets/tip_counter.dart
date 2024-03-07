import 'package:flutter/material.dart';

class TipCounter extends StatelessWidget {
  const TipCounter({
    super.key,
    required this.textStyle,
    required double tipAmount,
    required double tipFactor,
    required this.onChanged,
  })  : _tipAmount = tipAmount,
        _tipFactor = tipFactor;

  final TextStyle textStyle;
  final double _tipAmount;
  final double _tipFactor;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Tip',
              style: textStyle.copyWith(color: Colors.black87, fontSize: 20),
            ),
            Text(
              '₹ $_tipAmount',
              style: textStyle.copyWith(color: Colors.black87, fontSize: 20),
            ),
          ],
        ),
        Column(
          children: [
            Text('${(_tipFactor * 100).round()}%',
                style: textStyle.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    fontSize: 20)),
            Slider(
                value: _tipFactor,
                divisions: 5,
                min: 0,
                max: 0.5,
                onChanged: onChanged),
          ],
        ),
      ],
    );
  }
}
