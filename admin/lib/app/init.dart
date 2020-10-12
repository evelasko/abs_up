import 'dart:io';

import 'package:abs_up_datamodel/abs_up_datamodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'initial_data.dart';
import 'locator.dart';

Future<bool> initializeApp([String env = 'dev']) async {
  try {
    /// Initialize Firebase App
    // await Firebase.initializeApp(
    // name: '',
    // options: const FirebaseOptions(
    //   apiKey: 'AIzaSyBHAtF3MPyXzJpsfWALrCR2GdoAc5s373E',
    //   authDomain: 'abs-up.firebaseapp.com',
    //   databaseURL: 'https://abs-up.firebaseio.com',
    //   projectId: 'abs-up',
    //   storageBucket: 'abs-up.appspot.com',
    //   messagingSenderId: '324304430620',
    //   appId: '1:324304430620:web:ad3d4d42ab2651812be1d9',
    //   measurementId: 'G-GQC78LZW7X',
    // ),
    // );

    final databaseURL = env == Environment.dev
        ? kIsWeb
            ? 'localhost:8080'
            : Platform.isAndroid
                ? '10.0.2.2:8080'
                : 'localhost:8080'
        : 'https://abs-up.firebaseio.com';

    await Flamingo.initializeApp(
        options: FirebaseOptions(
          apiKey: 'AIzaSyBHAtF3MPyXzJpsfWALrCR2GdoAc5s373E',
          authDomain: 'abs-up.firebaseapp.com',
          databaseURL: databaseURL,
          projectId: 'abs-up',
          storageBucket: 'abs-up.appspot.com',
          messagingSenderId: '324304430620',
          appId: '1:324304430620:web:ad3d4d42ab2651812be1d9',
          measurementId: 'G-GQC78LZW7X',
        ),
        settings: Settings(
            host: kIsWeb
                ? 'localhost:8080'
                : Platform.isAndroid
                    ? '10.0.2.2:8080'
                    : 'localhost:8080',
            sslEnabled: false));

    /// Dependency injection setup
    await setupLocator(env);
    await getIt.allReady(timeout: const Duration(seconds: 7));

    if (env == Environment.dev) {
      await setInitialData(getIt<Flamingo>());
    }

    return true;
  } on WaitingTimeOutException {
    print('timeout exceeded');
    return false;
  } catch (e) {
    print('Unknown error while initializing:\n$e');
    return false;
  }
}
