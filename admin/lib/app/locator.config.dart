// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flamingo/flamingo.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth/auth.i.dart';
import '../services/auth/auth.s.dart';
import '../services/modules.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<DialogService>(() => thirdPartyServicesModule.dialogService);
  gh.lazySingleton<FirebaseAuth>(() => thirdPartyServicesModule.firebaseAuth);
  gh.lazySingleton<Flamingo>(() => thirdPartyServicesModule.flamingo);
  gh.lazySingleton<GoogleSignIn>(() => thirdPartyServicesModule.googleSignIn);
  gh.lazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  final sharedPreferences = await thirdPartyServicesModule.preferences;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);

  // Eager singletons must be registered in the right order
  gh.singleton<AuthInterface>(
      AuthService(get<FirebaseAuth>(), get<GoogleSignIn>()),
      signalsReady: false);
  return get;
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
