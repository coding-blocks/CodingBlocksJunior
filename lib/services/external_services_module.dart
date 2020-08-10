import 'package:coding_blocks_junior/services/store.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ExternalServicesModule {
  @LazySingleton()
  NavigationService get navigationService;

  @Singleton()
  StoreService get storeService;
}
