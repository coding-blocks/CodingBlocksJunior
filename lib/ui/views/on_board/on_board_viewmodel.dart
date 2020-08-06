import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnBoardViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final _title = 'On-Boarding';
  String get title => _title;

  Future goToHome() async {
    await _navigationService.navigateTo(Routes.coursesView);
  }
}
