import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/screens/providers/tip_calculator_model.dart';
import 'package:tip_calculator/widgets/bill_amount_field.dart';
import 'package:tip_calculator/widgets/per_person_amount_display.dart';
import 'package:tip_calculator/widgets/person_counter.dart';
import 'package:tip_calculator/widgets/tip_counter.dart';

class TipBaba extends StatefulWidget {
  const TipBaba({super.key});

  @override
  State<TipBaba> createState() => _TipBabaState();
}

class _TipBabaState extends State<TipBaba> {
  @override
  Widget build(BuildContext context) {
    final stateModel = Provider.of<TipCalculatorModel>(context);
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
            child: PerPersonAmountDisplay(
                theme: theme,
                textStyle: textStyle,
                amountPerPerson: stateModel.amountPerPerson),
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
                  BillAmountField(
                    textAreaInputChange: (String value) =>
                        stateModel.textAreaInputChange(value),
                  ),
                  PersonCounter(
                    textStyle: textStyle,
                    peopleCount: stateModel.peopleCount,
                    onIncrement: () => stateModel
                        .updatePeopleCount(stateModel.peopleCount + 1),
                    onDecrement: () => stateModel
                        .updatePeopleCount(stateModel.peopleCount - 1),
                  ),
                  TipCounter(
                    textStyle: textStyle,
                    tipAmount: stateModel.tipAmount,
                    tipFactor: stateModel.tipFactor,
                    onChanged: (double value) =>
                        stateModel.updateTipFactor(value),
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
