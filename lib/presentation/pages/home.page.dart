import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../widgets/home_section_menu.dart';
import '../widgets/home_section_perform.dart';

/// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
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

      /// Body
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// Perform Section
            PerformWorkoutHomeSection(),

            /// Menu Section
            MenuHomeSection()
          ],
        ),
      ),

      /// Design details
      backgroundColor: AppColors.greyDarkest,
    );
  }
}
