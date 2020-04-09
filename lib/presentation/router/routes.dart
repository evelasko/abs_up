import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/exercise_list.page.dart';
import '../pages/exercise_blacklist.page.dart';
import '../pages/exercise_favorites.page.dart';
import '../pages/workout_details.page.dart';
import '../pages/workout_list.page.dart';
import '../pages/workout_logs.page.dart';
import '../pages/home.page.dart';
// import '../pages/splash.page.dart';

class FluroRouter {
  static Router router = Router();

  /// Splash
  // static const splashLink = 'splash';
  // static Handler _splash = Handler(
  //     handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
  //         SplashPage());

  /// Home
  static const homeLink = 'home';
  static Handler _home = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage());

  /// Exercise List
  static const exerciseListLink = 'exercise/list';
  static Handler _exerciseList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExerciseListPage());

  /// Exercise Favorites
  static const exerciseFavoritesLink = 'exercise/favorites';
  static Handler _exerciseFavorites = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExerciseFavoritesPage());

  /// Exercise Blacklist
  static const exerciseBlacklistLink = 'exercise/blacklist';
  static Handler _exerciseBlacklist = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ExerciseBlacklistPage());

  /// Workout List
  static const workoutListLink = 'workout/list';
  static Handler _workoutList = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutListPage());

  /// Workout Details
  static const workoutDetailsLink = 'workout/details/:workoutId';
  static String getWorkoutDetailsLink({String workoutId}) =>
      workoutDetailsLink.replaceFirst(':workoutId', workoutId);
  static Handler _workoutDetails =
      Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    print(params);
    return WorkoutListPage();
  }
          // =>
          //     WorkoutDetailsPage(
          //       workoutId: params['workoutId'][0],
          //     )
          );

  /// Workout Logs
  static const workoutLogsLink = 'workout/logs';
  static Handler _workoutLogs = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          WorkoutLogsPage());

  /// Router Setup
  static void setupRouter() {
    router.define('/', handler: _home);
    // router.define(splashLink, handler: _splash);
    router.define(homeLink, handler: _home);
    router.define(exerciseListLink,
        handler: _exerciseList, transitionType: TransitionType.inFromRight);
    router.define(exerciseFavoritesLink,
        handler: _exerciseFavorites,
        transitionType: TransitionType.inFromRight);
    router.define(exerciseBlacklistLink,
        handler: _exerciseBlacklist,
        transitionType: TransitionType.inFromRight);
    router.define(workoutListLink,
        handler: _workoutList, transitionType: TransitionType.inFromRight);
    router.define(workoutDetailsLink,
        handler: _workoutDetails, transitionType: TransitionType.inFromRight);
    router.define(workoutLogsLink,
        handler: _workoutLogs, transitionType: TransitionType.inFromRight);
  }
}
