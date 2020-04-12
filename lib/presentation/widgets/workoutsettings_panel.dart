import 'package:data_setup/domain/repositories/data_values.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/workout_settings.dart';
import '../../domain/repositories/i_hive_facade.dart';
import 'workoutsettings_bottomsheet.dart';
import 'equipment_row.dart';
import 'typography.dart';

class CurrentWorkoutsettingsPanel extends StatelessWidget {
  const CurrentWorkoutsettingsPanel({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: IHiveFacade.workoutSettingsBox
          .listenable(keys: [DataValues.workoutSettingsKey]),
      builder: (context, Box<WorkoutSettings> box, widget) {
        final WorkoutSettings settings = box.get(DataValues.workoutSettingsKey);
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /// Info Rows
              AppTypography.settingsDataRow('Length', settings.lengthString),
              AppTypography.settingsDataRow(
                  'Intensity', settings.intensityString),
              AppTypography.settingsDataRow(
                  'Difficulty', settings.difficultyString),
              AppTypography.settingsDataRow('Impact', settings.impactString),

              /// Equipment Row
              equipmentRow(activeEquipment: settings.equipment),

              /// Edit Settings button
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: RaisedButton(
                    onPressed: () {
                      PersistentBottomSheetController sheetController =
                          showBottomSheet(
                        context: context,
                        builder: (context) => MainBottomSheetContent(),
                      );

                      sheetController.closed
                          .then((value) => print('sheet has closed: $value'));
                    },
                    child: Text('edit settings'),
                  ))
            ],
          ),
        );
      },
    );
  }
}
