import 'package:flutter/material.dart';

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

      //= Body Content
      body: SizedBox.expand(
        child: <Widget>[
          const ExercisesPage(), // index 0
          WorkoutsPage(), // index 1
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
