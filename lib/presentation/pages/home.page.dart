import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/state/exercises_store.dart';
import '../../domain/state/workouts_store.dart';
import '../../services/exercise.s.dart';
import '../../services/workout.s.dart';
import '../theme/colors.t.dart';
import 'exercises.page.dart';
import 'main.page.dart';
import 'workouts.page.dart';

/// Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final WorkoutService _workoutService = WorkoutService();

  int _selectedIndex = 2;

  void _onTabSelected(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //= Body Content
      body: SizedBox.expand(
        child: <Widget>[
          //= Exercises Page
          Provider(
            create: (context) => ExercisesStore(ExerciseService()),
            child: const ExercisesPage(),
          ),
          //= Saved Workouts Page
          Provider(
            create: (context) => WorkoutsStore(_workoutService),
            child: WorkoutsPage(),
          ),
          //= Main Page
          Provider(create: (context) => _workoutService, child: MainPage()),
          //= Feed Page
          // TODO implement the feed page
          const Center(child: Text('Feed Section')),
          //= Settings & Profile Page
          // TODO implement the settings and profile page
          const Center(child: Text('Profile & Settings Section')),
        ].elementAt(_selectedIndex),
      ),

      //= Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        unselectedItemColor: AppColors.greyLight,
        selectedItemColor: AppColors.coquelicot,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          //= Exercises
          BottomNavigationBarItem(
            title: SizedBox(width: 0, height: 0),
            icon: Icon(Icons.local_library),
          ),
          //= Saved Workouts
          BottomNavigationBarItem(
            title: SizedBox(width: 0, height: 0),
            icon: Icon(Icons.import_contacts),
          ),
          //= Perform
          BottomNavigationBarItem(
            title: SizedBox(width: 0, height: 0),
            icon: Icon(
              Icons.play_circle_filled,
              size: 40,
            ),
          ),
          //= Feed
          BottomNavigationBarItem(
            title: SizedBox(width: 0, height: 0),
            icon: Icon(Icons.rss_feed),
          ),
          //= Settings & Profile
          BottomNavigationBarItem(
            title: SizedBox(width: 0, height: 0),
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
