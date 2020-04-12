import 'package:flutter/material.dart';

import 'buttons.dart';
import 'workoutsettings_panel.dart';

class PerformWorkoutHomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          /// Main buttons
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AppButtons.boxedBigIconButton(
                    onTap: () {},
                    icon: Icons.playlist_play,
                    text: 'preview',
                    buttonType: ButtonTypes.secondary),
                AppButtons.boxedBigIconButton(
                    onTap: () {},
                    icon: Icons.play_circle_outline,
                    text: 'start')
              ],
            ),
          ),

          /// Current Workout Settings Panel
          CurrentWorkoutsettingsPanel()
        ],
      ),
    );
  }
}
