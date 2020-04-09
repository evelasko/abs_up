import 'package:data_setup/presentation/widgets/bottomsheets_main.dart';
import 'package:data_setup/presentation/widgets/perform_home_section.dart';
import 'package:flutter/material.dart';

import '../router/routes.dart';
import '../theme/colors.dart';
import '../theme/icons.dart';
import '../widgets/buttons.dart';
import '../widgets/typography.dart';

// Home page...
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Icon(
          AbsAppIcons.logo_fill,
          color: AppColors.greyLight,
          size: 32,
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 32,
            color: AppColors.greyLight,
            onPressed: () {}),
        actions: <Widget>[
          IconButton(
              padding: EdgeInsets.only(top: 8),
              icon: Icon(
                Icons.person,
              ),
              iconSize: 32,
              color: AppColors.greyLight,
              onPressed: () {})
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        color: AppColors.greyDarkest,
        child: Column(
          children: <Widget>[
            /// Exercises Section
            AppTypography.sectionHeadingLight('exercises'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  /// Exercise List
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context, FluroRouter.exerciseListLink),
                      icon: Icons.local_library,
                      text: 'learn'),

                  /// Exercise Favorites
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context, FluroRouter.exerciseFavoritesLink),
                      icon: Icons.grade,
                      text: 'favorites'),

                  /// Exercise Blacklist
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context, FluroRouter.exerciseBlacklistLink),
                      icon: Icons.not_interested,
                      text: 'blacklist')
                ],
              ),
            ),

            /// Workouts Section
            AppTypography.sectionHeadingLight('workouts'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  /// Workout List
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context, FluroRouter.workoutListLink),
                      icon: Icons.import_contacts,
                      text: 'saved'),

                  /// Workout Logs
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context, FluroRouter.workoutLogsLink),
                      icon: Icons.timeline,
                      text: 'activity'),

                  /// New Workout
                  AppButtons.homePageButton(
                      onTap: () => Navigator.pushNamed(
                          context,
                          FluroRouter.getWorkoutDetailsLink(
                              workoutId: 'WO-123')),
                      icon: Icons.fitness_center,
                      text: 'build new')
                ],
              ),
            ),

            /// Perform Section
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: PerformWorkoutHomeSection())
          ],
        ),
      ),

      /// Extra widgets
      floatingActionButton: FloatingActionButton(onPressed: () {
        showBottomSheet(
            context: context, builder: (context) => MainBottomSheet());
      }),
    );
  }
}
