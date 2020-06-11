import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:abs_up/secrets.dart';
import 'package:abs_up/services/auth.s.dart';
import 'package:abs_up/services/workout.s.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';

import 'constants.dart';
import 'domain/state/auth_store.dart';
import 'domain/state/exercises_store.dart';
import 'domain/state/workouts_store.dart';
import 'presentation/router/routes.dart';
import 'presentation/theme/theme.t.dart';
import 'services/exercise.s.dart';

class AbsUp extends StatefulWidget {
  @override
  _AbsUpState createState() => _AbsUpState();
}

class _AbsUpState extends State<AbsUp> {
  final WorkoutService _workoutService = WorkoutService();
  final _navigatorKey = GlobalKey<NavigatorState>();

  final AuthStore _authStore = AuthStore(
    FirebaseAuthService(
      FirebaseAuth.instance,
      GoogleSignIn(scopes: ['email']),
    ),
  );

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: _authStore.authCheck(),
        builder: (BuildContext ctx, AsyncSnapshot<bool> snapshot) => !snapshot
                .hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : MultiProvider(
                providers: [
                  Provider(create: (_) => ExercisesStore(ExerciseService())),
                  Provider(create: (_) => WorkoutsStore(_workoutService)),
                  Provider(create: (_) => _workoutService),
                  Provider(create: (_) => _authStore),
                ],
                child: Wiredash(
                  projectId: WIREDASH_PROJECT_ID,
                  secret: WIREDASH_API_SECRET,
                  options: WiredashOptionsData(
                    showDebugFloatingEntryPoint: false,
                  ),
                  theme: WiredashThemeData(
                      brightness: Brightness.dark,
                      backgroundColor: AppColors.greyDarkest,
                      primaryTextColor: AppColors.greyLight,
                      primaryColor: AppColors.rudy,
                      secondaryColor: AppColors.orange),
                  navigatorKey: _navigatorKey,
                  child: MaterialApp(
                    title: 'Abs Up',
                    theme: appTheme,
                    onGenerateRoute: FluroRouter.router.generator,
                    navigatorKey: _navigatorKey,
                    initialRoute: HOME_LINK,
                  ),
                ),
              ),
      );

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
