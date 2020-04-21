import 'package:data_setup/presentation/pages/workout_perform.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../domain/repositories/data_values.dart';
import '../pages/exercise_details.page.dart';
import '../pages/exercises.page.dart';
import '../pages/home.page.dart';
import '../pages/workout_details.page.dart';
import '../pages/workout_list.page.dart';
import '../pages/workout_logs.page.dart';

// ignore: avoid_classes_with_only_static_members
class FluroRouter {
  static Router router = Router();

  //= Home
  static final Handler _home = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage());

  //= Exercise List
  static final Handler _exerciseList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExercisePage());

  //= Exercise Details
  static const exerciseDetailsLink =
      '${DataValues.exerciseDetailsLink}:exerciseKey';
  static String getExerciseDetailsLink({String exerciseKey}) =>
      exerciseDetailsLink.replaceFirst(':exerciseKey', exerciseKey);
  static final Handler _exerciseDetails = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExerciseDetailsPage(params['exerciseKey'][0].toString()));

  //= Workout List
  static final Handler _workoutList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutListPage());

  //= Workout Details
  static const workoutDetailsLink =
      '${DataValues.workoutDetailsLink}:workoutKey';
  static String getWorkoutDetailsLink({String workoutKey}) =>
      workoutDetailsLink.replaceFirst(':workoutKey', workoutKey);
  static final Handler _workoutDetails = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutDetailsPage(params['workoutKey'][0].toString()));

  //= Workout Perform
  static const workoutPerformLink =
      '${DataValues.workoutPerformLink}:workoutKey';
  static String getWorkoutPerformLink({String workoutKey}) =>
      workoutPerformLink.replaceFirst(':workoutKey', workoutKey);
  static final Handler _workoutPerform = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutPerformPage(params['workoutKey'][0].toString()));

  //= Workout Logs
  static const workoutLogsLink = 'workout/logs';
  static final Handler _workoutLogs = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutLogsPage());

  /// Router Setup
  static void setupRouter() {
    //= Home
    router.define('/', handler: _home);
    router.define(DataValues.homeLink, handler: _home);
    //= Exercises List
    router.define(DataValues.exercisesListLink,
        handler: _exerciseList, transitionType: TransitionType.inFromRight);
    //= Exercise Details
    router.define(exerciseDetailsLink,
        handler: _exerciseDetails, transitionType: TransitionType.inFromBottom);
    //= Workout List
    router.define(DataValues.workoutListLink,
        handler: _workoutList, transitionType: TransitionType.inFromRight);
    //= Workout Details
    router.define(workoutDetailsLink,
        handler: _workoutDetails, transitionType: TransitionType.inFromRight);
    //= Workout Perform
    router.define(workoutPerformLink,
        handler: _workoutPerform, transitionType: TransitionType.inFromRight);
    //= Workout Logs
    router.define(DataValues.workoutLogsLink,
        handler: _workoutLogs, transitionType: TransitionType.inFromRight);
  }
}
