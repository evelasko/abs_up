import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';

import 'config.dart';
import 'constants.dart';
import 'domain/state/auth_store.dart';
import 'domain/state/exercises_store.dart';
import 'domain/state/perform_store.dart';
import 'domain/state/workouts_store.dart';
import 'init.dart';
import 'injection.dart';
import 'presentation/router/routes.dart';
import 'presentation/theme/colors.t.dart';
import 'presentation/theme/theme.t.dart';

class AbsUp extends StatefulWidget {
  @override
  _AbsUpState createState() => _AbsUpState();
}

class _AbsUpState extends State<AbsUp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: initializeAbsUp(),
        builder: (BuildContext ctx, AsyncSnapshot<bool> snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? MultiProvider(
                    providers: [
                      Provider(create: (_) => getIt.get<AuthStore>()),
                      Provider(create: (_) => getIt.get<ExercisesStore>()),
                      Provider(create: (_) => getIt.get<WorkoutsStore>()),
                      Provider(create: (_) => getIt.get<PerformStore>()),
                    ],
                    child: Wiredash(
                      projectId: Config.getWiredashProjectId(),
                      secret: Config.getWiredashApiKey(),
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
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
      );

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
