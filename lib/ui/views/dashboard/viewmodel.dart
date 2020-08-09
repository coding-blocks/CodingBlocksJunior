import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final List<String> dashboardView = [
    DashboardViewRoutes.dashboardBookmarksView,
    DashboardViewRoutes.dashboardHomeView,
    DashboardViewRoutes.dashboardNotesView,
    DashboardViewRoutes.dashboardProfileView,
  ];
  final int _selectedIndex = 1;

  int get selectedIndex => _selectedIndex;
}
