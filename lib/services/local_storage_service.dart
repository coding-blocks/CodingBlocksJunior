import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  SharedPreferences preferences;
  var ready;

  LocalStorageService() {
    ready = _getInstance();
  }

  Future _getInstance() async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    }
  }
}
