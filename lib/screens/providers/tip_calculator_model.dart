import 'package:flutter/material.dart';

class TipCalculatorModel with ChangeNotifier {
  double _billAmount = 0;
  double _tipAmount = 0;
  double _tipFactor = 0;
  int _peopleCount = 1;
  double _amountPerPerson = 0;
  double get tipAmount => _tipAmount;
  double get tipFactor => _tipFactor;
  int get peopleCount => _peopleCount;
  double get amountPerPerson => _amountPerPerson;

  void updatePeopleCount(int newPeopleCount) {
    if (newPeopleCount > 0) {
      _peopleCount = newPeopleCount;
      _calculateAmountPerPerson();
    }
    notifyListeners();
  }

  void updateTipFactor(double newTipFactor) {
    _tipFactor = newTipFactor;
    _tipAmount = _billAmount * _tipFactor;
    _calculateAmountPerPerson();
    notifyListeners();
  }

  void textAreaInputChange(String value) {
    value = value == "" ? "0" : value;
    _billAmount = double.parse(value);
    _calculateAmountPerPerson();
    notifyListeners();
  }

  void _calculateAmountPerPerson() {
    _amountPerPerson = _billAmount / _peopleCount + _tipAmount;
  }
}
