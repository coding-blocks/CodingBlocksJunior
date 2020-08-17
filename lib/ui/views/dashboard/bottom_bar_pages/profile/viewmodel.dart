import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:stacked/stacked.dart';

class DashboardProfileViewModel extends BaseViewModel {
  SessionService sessionService = locator<SessionService>();

  void logout() async{
    await sessionService.logout();
    notifyListeners();
  }
}
