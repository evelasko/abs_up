import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/widgets/current_workout_settings_panel.dart';
import 'package:flutter/material.dart';

import '../theme/text.dart';
import 'buttons.dart';

class PerformWorkoutHomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: Colors.white)),
      child: Column(
        children: <Widget>[
          /// Section header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text('perform workout'.toUpperCase(),
                style: AppTextStyles.appSectionHeadingLightText
                    .copyWith(color: AppColors.greyLight)),
          ),

          /// Main buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
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
