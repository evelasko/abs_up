import 'package:abs_up/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/workout_settings.dart';
import '../../services/p_data.s.dart';
import 'home_bottomsheet_workoutsettings.dart';
import 'shared/equipment_row.dart';
import 'shared/typography.dart';

class HomeSectionWorkoutsettings extends StatelessWidget {
  const HomeSectionWorkoutsettings({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PDataService.workoutSettingsBox
          .listenable(keys: [WORKOUT_SETTINGS_KEY]),
      builder: (context, Box<WorkoutSettings> box, widget) {
        final WorkoutSettings settings = box.get(WORKOUT_SETTINGS_KEY);
        return GestureDetector(
          onTap: () {
            final PersistentBottomSheetController sheetController =
                showBottomSheet(
              context: context,
              builder: (context) => HomeBottomSheetWorkoutsettings(),
            );

            // TODO implement workout settings' bottom sheet closing
            sheetController.closed.then((_) => {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //= Info Rows
                AppTypography.settingsDataRow('Length', settings.lengthString),
                AppTypography.settingsDataRow(
                    'Intensity', settings.intensityString),
                AppTypography.settingsDataRow(
                    'Difficulty', settings.difficultyString),
                AppTypography.settingsDataRow('Impact', settings.impactString),

                //= Equipment Row
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: equipmentRow(activeEquipment: settings.equipment),
                ),

                //= Edit Settings button
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 25),
                  child: const Text(
                    'edit settings',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
