import 'package:coding_blocks_junior/services/local_storage_service.dart';
import 'package:coding_blocks_junior/services/session.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import 'amoeba_api.dart';
/*
 * Run the below command whenever there is a addition of a new service
 * flutter packages pub run build_runner build  --delete-conflicting-outputs
 */
@module
abstract class ExternalServicesModule {
  @LazySingleton()
  NavigationService get navigationService;

  @Singleton()
  AmoebaApiService get amoebaService;

  @Singleton()
  SessionService get sessionService;

  @Singleton()
  LocalStorageService get localStorageService;
}
