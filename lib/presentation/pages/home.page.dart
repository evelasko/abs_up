import 'package:abs_up/domain/state/exercises_store.dart';
import 'package:abs_up/domain/state/workouts_store.dart';
import 'package:abs_up/services/exercise.s.dart';
import 'package:abs_up/services/workout.s.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../router/routes.dart';
import '../theme/colors.t.dart';
import '../widgets/shared/fab_bottom_appbar.w.dart';
import 'exercises.page.dart';
import 'workouts.page.dart';

/// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _selectedIndex = 0;

  void _onTabSelected(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // appBar: AppBar(actions: [
      //             IconButton(
      //         padding: const EdgeInsets.only(top: 8),
      //         icon: const Icon(
      //           Icons.person,
      //         ),
      //         iconSize: 32,
      //         color: AppColors.greyLight,
      //         onPressed: () => showDialog(
      //             context: context,
      //             builder: (BuildContext context) => Provider(
      //                   create: (_) => AuthStore(FirebaseAuthService(
      //                       FirebaseAuth.instance, GoogleSignIn())),
      //                   child: const LoginDialog(),
      //                 )))
      // ],),
      //= Body Content
      body: SizedBox.expand(
        child: <Widget>[
          Provider(
            create: (context) => ExercisesStore(ExerciseService()),
            child: const ExercisesPage(),
          ),
          Provider(
            create: (context) => WorkoutsStore(WorkoutService()),
            child: WorkoutsPage(),
          ),
          const Center(child: Text('Feed Section')), // index 2
          const Center(child: Text('Profile & Settings Section')), // index 3
        ].elementAt(_selectedIndex),
      ),

      //= Perform Button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
            FluroRouter.getWorkoutDetailsLink(workoutKey: CURRENT_WORKOUT_KEY)),
        tooltip: 'Perform',
        backgroundColor: AppColors.coquelicot,
        foregroundColor: Colors.white,
        elevation: 0,
        child: const Icon(Icons.playlist_play),
      ),

      //= Bottom Navigation Bar
      bottomNavigationBar: FABBottomAppBar(
        // centerItemText: 'Perform',
        height: 40,
        iconSize: 28,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onTabSelected,
        labelStyle: const TextStyle(
          fontSize: 12,
        ),
        labelStyleSelected:
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        backgroundColor: Theme.of(context).bottomAppBarColor,
        color: Colors.white,
        selectedColor: AppColors.coquelicot,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.local_library,
            //text: 'Exercises',
          ),
          FABBottomAppBarItem(
            iconData: Icons.import_contacts,
            //text: 'Workouts',
          ),
          FABBottomAppBarItem(
            iconData: Icons.rss_feed,
            //text: 'Feed',
          ),
          FABBottomAppBarItem(
            iconData: Icons.person,
            //text: 'Profile',
          ),
        ],
      ),
    );
  }
}
