// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:abs_up/domain/models/exercise.dart';
import 'package:hive/hive.dart';
import 'package:abs_up/services/core/injectable_modules.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:abs_up/services/exercise.s.dart';
import 'package:abs_up/domain/interfaces/exercise.i.dart';
import 'package:abs_up/domain/state/exercises_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:abs_up/services/speech.s.dart';
import 'package:abs_up/domain/interfaces/speech.i.dart';
import 'package:abs_up/services/user_settings.s.dart';
import 'package:abs_up/domain/interfaces/user_settings.i.dart';
import 'package:abs_up/services/workout.s.dart';
import 'package:abs_up/domain/interfaces/workout.i.dart';
import 'package:abs_up/services/workout_logs.s.dart';
import 'package:abs_up/domain/interfaces/workout_logs.i.dart';
import 'package:abs_up/domain/state/workouts_store.dart';
import 'package:abs_up/services/auth.s.dart';
import 'package:abs_up/domain/interfaces/auth.i.dart';
import 'package:abs_up/domain/state/auth_store.dart';
import 'package:abs_up/domain/state/perform_store.dart';
import 'package:abs_up/domain/state/settings_store.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final injectableModules = _$InjectableModules();
  g.registerLazySingleton<Box<Exercise>>(() => injectableModules.exercisesBox);
  g.registerLazySingleton<Box<Workout>>(() => injectableModules.workoutsBox);
  g.registerLazySingleton<Box<WorkoutLog>>(
      () => injectableModules.workoutLogsBox);
  g.registerLazySingleton<Box<WorkoutSettings>>(
      () => injectableModules.workoutSettingsBox);
  g.registerLazySingleton<ExercisesStore>(
      () => ExercisesStore(g<ExerciseInterface>()));
  g.registerLazySingleton<FirebaseAuth>(() => injectableModules.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => injectableModules.firestore);
  g.registerLazySingleton<FlutterTts>(() => injectableModules.flutterTts);
  g.registerLazySingleton<GoogleSignIn>(() => injectableModules.googleSignIn);
  g.registerLazySingleton<SpeechInterface>(
      () => SpeechService(g<FlutterTts>()));
  g.registerLazySingleton<WorkoutsStore>(() => WorkoutsStore(
        g<ExerciseInterface>(),
        g<WorkoutInterface>(),
        g<UserSettingsInterface>(),
        g<WorkoutLogsInterface>(),
      ));
  g.registerLazySingleton<AuthInterface>(
      () => FirebaseAuthService(g<FirebaseAuth>(), g<GoogleSignIn>()));
  g.registerLazySingleton<AuthStore>(() => AuthStore(g<AuthInterface>()));
  g.registerLazySingleton<PerformStore>(() => PerformStore(
        g<ExerciseInterface>(),
        g<WorkoutInterface>(),
        g<WorkoutLogsInterface>(),
        g<UserSettingsInterface>(),
        g<SpeechInterface>(),
      ));
  g.registerLazySingleton<SettingsStore>(
      () => SettingsStore(g<UserSettingsInterface>()));

  //Eager singletons must be registered in the right order
  g.registerSingletonAsync<ExerciseInterface>(
      () => ExerciseService.init(g<Box<Exercise>>()));
  g.registerSingletonAsync<UserSettingsInterface>(
      () => UserSettingsService.init(g<Box<WorkoutSettings>>()));
  g.registerSingleton<WorkoutInterface>(WorkoutService(g<Box<Workout>>()));
  g.registerSingleton<WorkoutLogsInterface>(
      WorkoutLogsService(g<Box<WorkoutLog>>()));
}

class _$InjectableModules extends InjectableModules {}
