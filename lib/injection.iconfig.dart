// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:abs_up/services/core/firebase_injectable_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:abs_up/services/auth.s.dart';
import 'package:abs_up/domain/interfaces/auth.i.dart';
import 'package:abs_up/domain/state/auth_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  g.registerLazySingleton<FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => firebaseInjectableModule.firestore);
  g.registerLazySingleton<GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  g.registerLazySingleton<AuthInterface>(
      () => FirebaseAuthService(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerFactory<AuthStore>(() => AuthStore(g<AuthInterface>()));
}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}
