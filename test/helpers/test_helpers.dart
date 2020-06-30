import 'dart:convert';
import 'dart:io';
import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/services/auth.s.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

/// Returns a matcher for functions that throw object with type [T]
Matcher throwsTypeOf<T>() => throwsA(isA<T>());

class WorkoutMock extends Mock implements Workout {}

class BoxWorkoutMock<Workout> extends Mock implements Box<Workout> {}

class BoxExerciseMock<Exercise> extends Mock implements Box<Exercise> {}

class BoxWSMock<WorkoutSettings> extends Mock implements Box<WorkoutSettings> {}

class FirebaseAuthMock extends Mock implements FirebaseAuth {}

class FirebaseUserMock extends Mock implements FirebaseUser {}

class AuthResultMock extends Mock implements AuthResult {}

class GoogleSignInMock extends Mock implements GoogleSignIn {}

// ignore: avoid_implementing_value_types
class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount {}

class GoogleSignInAuthenticationMock extends Mock
    implements GoogleSignInAuthentication {}

class FirebaseAuthServiceMock extends Mock implements FirebaseAuthService {}

Future<Iterable<Exercise>> fetchTestExercises() async {
  final Map<String, Exercise> localExercises = await fetchLocalExercises();
  return localExercises.values;
}

Future<Map<String, Exercise>> fetchLocalExercises() async {
  final Map<String, dynamic> localExercises = jsonDecode(File(
          '${Directory.current.path}/assets/data/exercises.json'
              .replaceAll('test/', ''))
      .readAsStringSync()) as Map<String, dynamic>;

  return localExercises.map<String, Exercise>((key, value) =>
      MapEntry(key, Exercise.fromMap(value as Map<String, dynamic>)));
}