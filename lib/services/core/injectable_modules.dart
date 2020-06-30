import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';

@registerModule
abstract class InjectableModules {
  @lazySingleton
  GoogleSignIn get googleSignIn => GoogleSignIn(scopes: ['email']);
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  @lazySingleton
  Firestore get firestore => Firestore.instance;
  @lazySingleton
  FlutterTts get flutterTts => FlutterTts();
  @lazySingleton
  Box<Workout> get workoutsBox => Hive.box<Workout>(WORKOUTS_BOX_NAME);
  @lazySingleton
  Box<Exercise> get exercisesBox => Hive.box<Exercise>(EXERCISE_BOX_NAME);
  @lazySingleton
  Box<WorkoutSettings> get workoutSettingsBox =>
      Hive.box<WorkoutSettings>(WORKOUT_SETTINGS_BOX_NAME);
  @lazySingleton
  Box<WorkoutLog> get workoutLogsBox => Hive.box(WORKOUT_LOGS_BOX_NAME);
}
