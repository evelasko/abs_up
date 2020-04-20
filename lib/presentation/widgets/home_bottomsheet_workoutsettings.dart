import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/models/equipment.dart';
import '../../domain/models/workout_settings.dart';
import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_hive_facade.dart';
import '../theme/colors.dart';
import '../theme/text.dart';
import 'shared/equipment_chips.dart';

class HomeBottomSheetWorkoutsettings extends StatefulWidget {
  @override
  _HomeBottomSheetWorkoutsettingsState createState() =>
      _HomeBottomSheetWorkoutsettingsState();
}

class _HomeBottomSheetWorkoutsettingsState
    extends State<HomeBottomSheetWorkoutsettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0, bottom: 20),
      decoration: BoxDecoration(
          color: AppColors.greyLightest,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: <Widget>[
          ///
          /// Sheet Header
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.close,
                      color: AppColors.greyDark,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(top: 8, left: 0, bottom: 8),
                    onPressed: () => Navigator.pop(context)),
                Text('shuffle Workout Settings'.toUpperCase()),
                IconButton(
                    icon: Icon(Icons.settings_backup_restore,
                        color: AppColors.greyDark),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(top: 8, left: 0, bottom: 8),
                    onPressed: () {})
              ],
            ),
          ),

          ///
          /// Choice Sections
          ValueListenableBuilder(
              valueListenable: IHiveFacade.workoutSettingsBox
                  .listenable(keys: [DataValues.workoutSettingsKey]),

              /// Listenable manager
              builder: (context, Box<WorkoutSettings> box, widget) {
                final WorkoutSettings settings =
                    box.get(DataValues.workoutSettingsKey);
                if (settings == null) {
                  return const Text('No previous workout settings found...');
                }
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ///
                        /// Length Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            /// Length Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Length',
                                  style: AppTextStyles
                                      .currentWorkoutSettingsData
                                      .copyWith(color: AppColors.greyDarkest),
                                ),
                                Text(
                                  '~ length',
                                  style: AppTextStyles
                                      .currentWorkoutSettingsData
                                      .copyWith(color: AppColors.grey),
                                )
                              ],
                            ),

                            /// Length Choice
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              margin: const EdgeInsets.only(bottom: 5),
                              child: CupertinoSlidingSegmentedControl<String>(
                                children: Map.fromIterable(
                                    DataValues.lengthStrings,
                                    key: (key) => key.toString(),
                                    value: (value) => Text(value.toString())),
                                onValueChanged: (newValue) {
                                  settings.lengthSetAndSave(newValue);
                                },
                                groupValue: settings.lengthString,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),

                        ///
                        /// Intensity Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            /// Intensity Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Intensity',
                                  style: AppTextStyles
                                      .currentWorkoutSettingsData
                                      .copyWith(color: AppColors.greyDarkest),
                                ),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.help,
                                        size: 24, color: AppColors.grey),
                                    constraints: BoxConstraints.tight(
                                        const Size(32, 32)),
                                    onPressed: () {})
                              ],
                            ),

                            /// Intensity Choice
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: CupertinoSlidingSegmentedControl<String>(
                                children: Map.fromIterable(
                                    DataValues.intensityStrings,
                                    key: (key) => key.toString(),
                                    value: (value) => Text(value.toString())),
                                onValueChanged: (newValue) {
                                  settings.intensitySetAndSave(newValue);
                                },
                                groupValue: settings.intensityString,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),

                        ///
                        /// Difficulty Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            /// Difficulty Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Difficulty',
                                  style: AppTextStyles
                                      .currentWorkoutSettingsData
                                      .copyWith(color: AppColors.greyDarkest),
                                ),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.help,
                                        size: 24, color: AppColors.grey),
                                    constraints: BoxConstraints.tight(
                                        const Size(32, 32)),
                                    onPressed: () {})
                              ],
                            ),

                            /// Difficulty Choice
                            Container(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              margin: const EdgeInsets.only(bottom: 10),
                              child: CupertinoSlidingSegmentedControl<String>(
                                children: Map.fromIterable(
                                    DataValues.difficultyStrings,
                                    key: (key) => key.toString(),
                                    value: (value) => Text(value.toString())),
                                onValueChanged: (newValue) {
                                  settings.difficultySetAndSave(newValue);
                                },
                                groupValue: settings.difficultyString,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          color: AppColors.grey,
                        ),

                        ///
                        /// Impact Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            /// Impact Header
                            Text(
                              'Include impact',
                              style: AppTextStyles.currentWorkoutSettingsData
                                  .copyWith(color: AppColors.greyDarkest),
                            ),
                            Row(
                              children: <Widget>[
                                /// Impact choice
                                Switch.adaptive(
                                    value: settings.impact,
                                    onChanged: (value) {
                                      settings.impactSetOrToggleAndSave(value);
                                    }),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.help,
                                        size: 24, color: AppColors.grey),
                                    constraints: BoxConstraints.tight(
                                        const Size(32, 32)),
                                    onPressed: () {}),
                              ],
                            )
                          ],
                        ),

                        Divider(
                          color: AppColors.grey,
                        ),

                        ///
                        /// Equipment Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            /// Equipment Header
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Equipment',
                                  style: AppTextStyles
                                      .currentWorkoutSettingsData
                                      .copyWith(color: AppColors.greyDarkest),
                                ),
                                IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Icon(Icons.help,
                                        size: 24, color: AppColors.grey),
                                    constraints: BoxConstraints.tight(
                                        const Size(32, 32)),
                                    onPressed: () {})
                              ],
                            ),

                            /// Equipment Choice
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                spacing: 5,
                                runSpacing: -3,
                                children: DataValues.equipmentDataKeys
                                    .map((key) => equipmentChip(
                                        equipment:
                                            Equipment.equipmentFromKey(key),
                                        onSelected: (value) => value
                                            ? settings.addEquipment(key: key)
                                            : settings.removeEquipment(
                                                key: key)))
                                    .toList(),
                              ),
                            )
                          ],
                        ),

                        ///
                        /// End of sheet content
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
