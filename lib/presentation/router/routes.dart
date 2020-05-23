import 'package:abs_up/presentation/pages/about.page.dart';
import 'package:abs_up/presentation/pages/feedback_contact.page.dart';
import 'package:abs_up/presentation/pages/help_support.page.dart';
import 'package:abs_up/presentation/pages/settings.page.dart';
import 'package:abs_up/presentation/pages/workout_item_details.page.dart';
import 'package:abs_up/presentation/pages/workout_perform.page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
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
  static const exerciseDetailsLink = '$EXERCISE_DETAILS_LINK:exerciseKey';
  static String getExerciseDetailsLink({String exerciseKey}) =>
      exerciseDetailsLink.replaceFirst(':exerciseKey', exerciseKey);
  static final Handler _exerciseDetails = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExerciseDetailsPage(params['exerciseKey'][0].toString()));

  //= Workout Item Details
  static const workoutItemDetailsLink =
      '$WORKOUT_ITEM_DETAILS_LINK:workoutKey/:itemIndex';
  static String getWorkoutItemDetailsLink({String workoutKey, int itemIndex}) =>
      workoutItemDetailsLink
          .replaceFirst(':workoutKey', workoutKey)
          .replaceFirst(':itemIndex', itemIndex.toString());
  static final Handler _workoutItemDetails = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutItemDetailsPage(
              workoutKey: params['workoutKey'][0].toString(),
              itemIndex: int.parse(params['itemIndex'][0].toString())));

  //= Workout List
  static final Handler _workoutList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutListPage());

  //= Workout Details
  static const workoutDetailsLink = '$WORKOUT_DETAILS_LINK:workoutKey';
  static String getWorkoutDetailsLink({String workoutKey}) =>
      workoutDetailsLink.replaceFirst(':workoutKey', workoutKey);
  static final Handler _workoutDetails = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutDetailsPage(params['workoutKey'][0].toString()));

  //= Workout Perform
  static const workoutPerformLink = '$WORKOUT_PERFORM_LINK:sourceWorkoutKey';
  static String getWorkoutPerformLink(
          {String sourceWorkoutKey = CURRENT_WORKOUT_KEY}) =>
      workoutPerformLink.replaceFirst(':sourceWorkoutKey', sourceWorkoutKey);
  static final Handler _workoutPerform = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutPerformPage(params['sourceWorkoutKey'][0].toString()));

  //= Workout Logs
  static const workoutLogsLink = 'workout/logs';
  static final Handler _workoutLogs = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutLogsPage());

  //= Settings Page
  static final Handler _settings = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          SettingsPage());

  //= About Page
  static final Handler _about = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          AboutPage());

  //= Feedback - Contact Page
  static final Handler _feedback = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          FeedbackContactPage());

  //= Help - Support Page
  static final Handler _support = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HelpSupportPage());

  /// Router Setup
  static void setupRouter() {
    //= Home
    router.define('/', handler: _home);
    router.define(HOME_LINK, handler: _home);
    //= Exercises List
    router.define(EXERCISES_LIST_LINK,
        handler: _exerciseList, transitionType: TransitionType.inFromRight);
    //= Exercise Details
    router.define(exerciseDetailsLink,
        handler: _exerciseDetails, transitionType: TransitionType.inFromBottom);
    //= Workout List
    router.define(WORKOUT_LIST_LINK,
        handler: _workoutList, transitionType: TransitionType.inFromRight);
    //= Workout Details
    router.define(workoutDetailsLink,
        handler: _workoutDetails, transitionType: TransitionType.inFromRight);
    //= Workout Item Details
    router.define(workoutItemDetailsLink,
        handler: _workoutItemDetails,
        transitionType: TransitionType.inFromBottom);
    //= Workout Perform
    router.define(workoutPerformLink,
        handler: _workoutPerform, transitionType: TransitionType.inFromRight);
    //= Workout Logs
    router.define(WORKOUT_LOGS_LINK,
        handler: _workoutLogs, transitionType: TransitionType.inFromRight);
    //= Settings
    router.define(SETTINGS_LINK,
        handler: _settings, transitionType: TransitionType.inFromRight);
    //= About
    router.define(ABOUT_LINK,
        handler: _about, transitionType: TransitionType.inFromRight);
    //= Feedback
    router.define(FEEDBACK_LINK,
        handler: _feedback, transitionType: TransitionType.inFromRight);
    //= Support
    router.define(SUPPORT_LINK,
        handler: _support, transitionType: TransitionType.inFromRight);
  }
}
