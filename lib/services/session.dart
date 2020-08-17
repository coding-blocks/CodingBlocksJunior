import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  var ready;
  FirebaseUser user;

  SessionService() {
    ready = _loadSessionData();
  }

  Future _loadSessionData() async {
    var prefs = await SharedPreferences.getInstance();
    user = await FirebaseAuth.instance.currentUser();

    if(user == null) {
      await FirebaseAuth.instance.signInAnonymously();
      user = await FirebaseAuth.instance.currentUser();
    }
  }

  Future _saveSessionData() async {
    var prefs = await SharedPreferences.getInstance();
  }

  Future login(loginPayload) async {
    final firebaseToken = loginPayload['firebaseToken'];
    await FirebaseAuth.instance.signInWithCustomToken(token: firebaseToken);
    user = await FirebaseAuth.instance.currentUser();
    _saveSessionData();
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signInAnonymously();
    user = await FirebaseAuth.instance.currentUser();
    _saveSessionData();
  }
}
