import 'package:flutter/material.dart';

class PillsProvider {
  final String name;
  final int interval;

  PillsProvider({
    required this.name,
    required this.interval,
  });
}

class DataProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  List<PillsProvider> _pills = [
    PillsProvider(name: 'Pill 1', interval: 8),
    PillsProvider(name: 'Pill 2', interval: 8),
  ];

  List<PillsProvider> get pills => _pills;

  void addPill(PillsProvider pill) {
    _pills.add(pill);
    notifyListeners();
  }

  void updatePill(int index, PillsProvider newPill) {
    _pills[index] = newPill;
    notifyListeners();
  }

  PillsProvider getPill(int index) {
    return _pills[index];
  }
}
