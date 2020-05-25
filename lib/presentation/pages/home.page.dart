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
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) => setState(() {
        _selectedIndex = index;
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      // /// App Bar
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Icon(
      //     AbsAppIcons.logo_fill,
      //     color: AppColors.greyLight,
      //     size: 32,
      //   ),
      //   leading: IconButton(
      //       icon: const Icon(Icons.menu),
      //       iconSize: 32,
      //       color: AppColors.greyLight,
      //       onPressed: () => _scaffoldKey.currentState.openDrawer()),
      //   actions: <Widget>[
      //     IconButton(
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
      //   ],
      // ),

      // /// Drawer
      // drawer: const AppDrawer(),

      /// Body
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: <Widget>[
            ExercisesPage(), // index 0
            WorkoutsPage(), // index 1
            const Center(child: Text('Feed Section')), // index 2
            const Center(child: Text('Profile & Settings Section')) // index 3
          ],
        ),
      ),

      /// Perform Button
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

      /// Bottom Navigation Bar
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Perform',
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
            text: 'Exercises',
          ),
          FABBottomAppBarItem(
            iconData: Icons.import_contacts,
            text: 'Workouts',
          ),
          FABBottomAppBarItem(
            iconData: Icons.rss_feed,
            text: 'Feed',
          ),
          FABBottomAppBarItem(
            iconData: Icons.person,
            text: 'Profile',
          ),
        ],
      ),
    );
  }
}
