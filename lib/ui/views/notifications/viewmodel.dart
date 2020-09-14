import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/models/notification.dart';
import 'package:coding_blocks_junior/services/local_storage_service.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:stacked/stacked.dart';

class NotificationViewModel extends StreamViewModel<QuerySnapshot> {
  SessionService sessionService = locator<SessionService>();
  LocalStorageService localStorageService = locator<LocalStorageService>();
  List<Notification> notifications = [];

  @override
  Stream<QuerySnapshot> get stream => Firestore
      .instance
      .collection('Notifications')
      .where("classGroup", isEqualTo: localStorageService.preferences.getString("classGroup"))
      .where("userId", isEqualTo: sessionService.user.uid)
      .snapshots();

  @override
  void onData(QuerySnapshot data) {
    notifications = data.documents.map((DocumentSnapshot snapshot) => Notification.fromSnapshot(snapshot)).toList();
  }
}
