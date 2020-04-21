import 'package:data_setup/presentation/widgets/home_section_workoutsettings.dart';
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
              padding: const EdgeInsets.only(top: 8),
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
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// Perform Section
            HomeSectionPerform(),

            /// Workout Settings Panel
            const HomeSectionWorkoutsettings(),

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
