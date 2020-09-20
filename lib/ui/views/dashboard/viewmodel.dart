import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
