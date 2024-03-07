import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.textStyle,
    required int peopleCount,
    required this.onIncrement,
    required this.onDecrement,
  }) : _peopleCount = peopleCount;

  final TextStyle textStyle;
  final int _peopleCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'People',
          style: textStyle.copyWith(color: Colors.black87, fontSize: 20),
        ),
        Row(
          children: [
            IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
            Text(
              '$_peopleCount',
              style: textStyle.copyWith(color: Colors.black87, fontSize: 20),
            ),
            IconButton(onPressed: onIncrement, icon: const Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}
