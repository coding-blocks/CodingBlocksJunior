import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  var isAuthenticated = false;
  var ready;
  String firebaseToken;
  FirebaseUser user;

  SessionService() {
    ready = _loadSessionData();
  }

  Future _loadSessionData() async {
    var prefs = await SharedPreferences.getInstance();
    isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    firebaseToken = prefs.getString('firebaseToken');
    user = await FirebaseAuth.instance.currentUser();
    print(prefs);
  }

  Future _saveSessionDate() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('isAuthenticated', isAuthenticated);
    prefs.setString('firebaseToken', firebaseToken);
  }

  Future login(loginPayload) async {
    firebaseToken = loginPayload['firebaseToken'];
    await FirebaseAuth.instance.signInWithCustomToken(token: firebaseToken);
    user = await FirebaseAuth.instance.currentUser();
    print(user.displayName);
    isAuthenticated = true;
    _saveSessionDate();
  }

  Future logout() async {
    isAuthenticated = false;
    firebaseToken = null;

    _saveSessionDate();
  }
}
