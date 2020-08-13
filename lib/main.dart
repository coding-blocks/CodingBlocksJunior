import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/services/store.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SessionService sessionService = locator<SessionService>();
  await sessionService.ready;
  runApp(MyApp());
  setupOneSignal();
}

void setupOneSignal() {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init(
      "b8f1cb4e-28c2-4aad-9fa9-ebd9895bef9b",
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: false
      }
  );
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Blocks Junior',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder(
        router: Router(),
        initialRoute: Routes.dashboardView,
        navigatorKey: locator<NavigationService>().navigatorKey,
        builder: (context, extendedNav) => Theme(
          data: ThemeData(
            fontFamily: 'Gilroy',
            primaryColor: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: extendedNav,
        ),
      ),
    );
  }
}
