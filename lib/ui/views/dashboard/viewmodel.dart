import 'package:coding_blocks_junior/app/locator.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends BaseViewModel {
  int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;

  setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
