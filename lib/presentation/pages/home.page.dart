import 'package:abs_up/domain/state/auth_store.dart';
import 'package:abs_up/infrastructure/firebase_auth_facade.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';
import '../widgets/drawer.dart';
import '../widgets/home_section_menu.dart';
import '../widgets/home_section_perform.dart';
import '../widgets/home_section_workoutsettings.dart';
import '../widgets/login_dialog.dart';

/// Home Page
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      /// App Bar
      appBar: AppBar(
        elevation: 0,
        title: const Icon(
          AbsAppIcons.logo_fill,
          color: AppColors.greyLight,
          size: 32,
        ),
        leading: IconButton(
            icon: const Icon(Icons.menu),
            iconSize: 32,
            color: AppColors.greyLight,
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        actions: <Widget>[
          IconButton(
              padding: const EdgeInsets.only(top: 8),
              icon: const Icon(
                Icons.person,
              ),
              iconSize: 32,
              color: AppColors.greyLight,
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => Provider(
                        create: (_) => AuthStore(FirebaseAuthFacade(
                            FirebaseAuth.instance, GoogleSignIn())),
                        child: const LoginDialog(),
                      )))
        ],
      ),

      /// Drawer
      drawer: const AppDrawer(),

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
