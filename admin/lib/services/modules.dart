import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  SnackbarService get snackbarService;

  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(
      scopes: ['email'],
      clientId:
          '324304430620-u0pmgt21gbckspb4cleg4ai2ba16fkqa.apps.googleusercontent.com');

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @Environment(Environment.dev)
  @lazySingleton
  FirebaseFirestore get firestoreDev => FirebaseFirestore.instance
    ..settings = Settings(
        host: kIsWeb
            ? 'localhost:8080'
            : Platform.isAndroid
                ? '10.0.2.2:8080'
                : 'localhost:8080',
        sslEnabled: false);

  @Environment(Environment.prod)
  @lazySingleton
  FirebaseFirestore get firestoreProd => FirebaseFirestore.instance;

  @lazySingleton
  HiveInterface get hive => Hive;

  @preResolve
  Future<SharedPreferences> get preferences => SharedPreferences.getInstance();
}
