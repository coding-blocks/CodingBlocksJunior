// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/external_services_module.dart';

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
  return get;
}

class _$ExternalServicesModule extends ExternalServicesModule {
  @override
  NavigationService get navigationService => NavigationService();
}
