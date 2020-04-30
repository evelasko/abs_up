import 'package:abs_up/domain/repositories/data_values.dart';
import 'package:abs_up/presentation/theme/colors.dart';
import 'package:abs_up/presentation/theme/icons.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      padding: const EdgeInsets.only(top: 100, right: 10, left: 10, bottom: 20),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              // begin: FractionalOffset.topCenter,
              // end: FractionalOffset.topCenter,
              begin: Alignment(0, -1.0),
              end: Alignment(0, 1.0),
              colors: [
            Color.fromARGB(255, 156, 157, 161),
            Color.fromARGB(255, 60, 61, 64)
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 94,
            child: const Icon(
              AbsAppIcons.logo_fill,
              color: AppColors.coquelicot,
              size: 90,
            ),
          ),
          Column(
            children: [
              DrawerMenuItem(
                  title: 'Settings',
                  onTap: () =>
                      Navigator.of(context).pushNamed(DataValues.settingsLink)),
              DrawerMenuItem(
                  title: 'About',
                  onTap: () =>
                      Navigator.of(context).pushNamed(DataValues.aboutLink)),
              DrawerMenuItem(
                  title: 'Feedback - Contact',
                  onTap: () =>
                      Navigator.of(context).pushNamed(DataValues.feedbackLink)),
              DrawerMenuItem(
                  title: 'Help - Support',
                  onTap: () =>
                      Navigator.of(context).pushNamed(DataValues.supportLink))
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 20),
                    child: Switch.adaptive(
                        inactiveTrackColor: AppColors.grey,
                        value: false,
                        onChanged: (newValue) => {}),
                  ),
                  const Expanded(
                      child: Text('Notify me when new exercises are added',
                          style: TextStyle(
                              color: AppColors.greyLightest, fontSize: 16)))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: 20, top: 30, left: 20, right: 20),
                child: const Text(
                    'Copyright © 2020 The Misfit Coach\nPrivacy & Legal Policies',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 10, color: AppColors.greyLight, height: 1.7)),
              )
            ],
          )
        ],
      ),
    ));
  }
}

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const DrawerMenuItem({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: const BoxDecoration(
            border:
                Border(bottom: BorderSide(color: AppColors.grey, width: 1))),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(title,
            style:
                const TextStyle(color: AppColors.greyLightest, fontSize: 16)),
      ),
    );
  }
}
