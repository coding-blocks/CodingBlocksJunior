// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/amoeba_api.dart';
import '../services/external_services_module.dart';
import '../services/local_storage_service.dart';
import '../services/session.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final externalServicesModule = _$ExternalServicesModule();
  gh.lazySingleton<NavigationService>(
      () => externalServicesModule.navigationService);

  // Eager singletons must be registered in the right order
  gh.singleton<AmoebaApiService>(externalServicesModule.amoebaService);
  gh.singleton<LocalStorageService>(externalServicesModule.localStorageService);
  gh.singleton<SessionService>(externalServicesModule.sessionService);
  return get;
}

class _$ExternalServicesModule extends ExternalServicesModule {
  @override
  AmoebaApiService get amoebaService => AmoebaApiService();
  @override
  LocalStorageService get localStorageService => LocalStorageService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SessionService get sessionService => SessionService();
}
