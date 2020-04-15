import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:data_setup/presentation/pages/exercise_details.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/data_values.dart';
import '../pages/exercises.page.dart';
import '../pages/home.page.dart';
import '../pages/workout_list.page.dart';
import '../pages/workout_logs.page.dart';

class FluroRouter {
  static Router router = Router();

  /// Home
  static Handler _home = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage());

  /// Exercises Page
  static Handler _exerciseList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExercisePage());

  /// Exercise Details
  static const exerciseDetailsLink =
      DataValues.exerciseDetailsLink + ':exerciseKey';
  static String getExerciseDetailsLink({String exerciseKey}) =>
      exerciseDetailsLink.replaceFirst(':exerciseKey', exerciseKey);
  static Handler _exerciseDetails =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    final Exercise exercise =
        IHiveFacade.exercisesBox.get(params['exerciseKey'][0]);
    return ExerciseDetailsPage(exercise);
  });

  /// Workout List
  static Handler _workoutList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutListPage());

  /// Workout Details
  static const workoutDetailsLink =
      DataValues.workoutDetailsLink + ':workoutId';
  static String getWorkoutDetailsLink({String workoutId}) =>
      workoutDetailsLink.replaceFirst(':workoutId', workoutId);
  static Handler _workoutDetails =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    print(params);
    return WorkoutListPage();
  });

  /// Workout Logs
  static const workoutLogsLink = 'workout/logs';
  static Handler _workoutLogs = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutLogsPage());

  /// Router Setup
  static void setupRouter() {
    router.define('/', handler: _home);
    // router.define(splashLink, handler: _splash);
    router.define(DataValues.homeLink, handler: _home);
    router.define(DataValues.exercisesListLink,
        handler: _exerciseList, transitionType: TransitionType.inFromRight);
    router.define(DataValues.workoutListLink,
        handler: _workoutList, transitionType: TransitionType.inFromRight);
    router.define(workoutDetailsLink,
        handler: _workoutDetails, transitionType: TransitionType.inFromRight);
    router.define(exerciseDetailsLink,
        handler: _exerciseDetails, transitionType: TransitionType.inFromRight);
    router.define(DataValues.workoutLogsLink,
        handler: _workoutLogs, transitionType: TransitionType.inFromRight);
  }
}
