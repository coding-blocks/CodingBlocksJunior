import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  int _selectedIndex = 1;
  int get selectedIndex => _selectedIndex;

  void onItemClick(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
