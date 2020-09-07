import 'package:auto_route/auto_route.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:coding_blocks_junior/utils/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:coding_blocks_junior/theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

bool firsRun;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SessionService sessionService = locator<SessionService>();
  await sessionService.ready;
  firsRun = await getSharedPrefs();
  //Crashlytics
  FlutterError.onError = Crashlytics.instance.recordFlutterError;


  runApp(MyApp());
  setupOneSignal();
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
  );
}

Future<bool> getSharedPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool("firstRun")?? true;
}

void setupOneSignal() {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init("b8f1cb4e-28c2-4aad-9fa9-ebd9895bef9b", iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: false
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String view;
    if(firsRun){
      view = Routes.onBoardView;
    }else{
      view = Routes.dashboardView;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Coding Blocks Junior',
              debugShowCheckedModeBanner: false,
              theme: buildTheme(context),
              builder: ExtendedNavigator.builder(
                router: Router(),
                initialRoute: view,
                navigatorKey: locator<NavigationService>().navigatorKey,
                builder: (context, extendedNav) => extendedNav,
              ),
            );
          },
        );
      },
    );
  }
}
