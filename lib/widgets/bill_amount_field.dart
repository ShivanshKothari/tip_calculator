import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key,
    required this.textAreaInputChange,
  });
  final ValueChanged<String> textAreaInputChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: textAreaInputChange,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.monetization_on_outlined),
        labelText: 'Bill Amount',
      ),
    );
  }
}
