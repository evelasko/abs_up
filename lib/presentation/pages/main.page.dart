import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/models/equipment.dart';
import '../../domain/models/workout_settings.dart';
import '../../services/workout.s.dart';
import '../router/routes.dart';
import '../theme/colors.t.dart';
import '../theme/text.t.dart';
import '../widgets/shared/buttons.w.dart';
import '../widgets/shared/equipment_chips.w.dart';
import '../widgets/shared/extreme_row.w.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  WorkoutService workoutService;
  WorkoutSettings settings;

  @override
  void didChangeDependencies() {
    workoutService = Provider.of<WorkoutService>(context);
    settings = workoutService.workoutSettings;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: workoutService.workoutSettingsListenable,
              builder: (_, __, ___) => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: true,
                    title: const Text('Workout Settings'),
                    actions: [
                      IconButton(
                          icon: const Icon(Icons.settings_backup_restore),
                          onPressed: () {
                            // TODO implement reset settings to defaults
                          })
                    ],
                  ),
                  //= Workout Settings Form Items
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        const SizedBox(
                          width: double.infinity,
                          height: 20,
                        ),
                        //= Length Header
                        ExtremeRow.symmetric(
                          v: 5,
                          h: 15,
                          left: Text(
                            'Length'.toUpperCase(),
                            style: AppTextStyles.currentWorkoutSettingsData
                                .copyWith(color: AppColors.grey),
                          ),
                          right: Container(
                            alignment: Alignment.centerRight,
                            height: 32,
                            child: Text(
                              '~ length',
                              style: AppTextStyles.currentWorkoutSettingsData
                                  .copyWith(color: AppColors.grey),
                            ),
                          ),
                        ),
                        //= Length Choice
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: CupertinoSlidingSegmentedControl<String>(
                            children: Map.fromIterable(LENGTH_STRINGS,
                                key: (key) => key.toString(),
                                value: (value) => Text(value.toString())),
                            onValueChanged: (newValue) {
                              settings.lengthSetAndSave(newValue);
                            },
                            groupValue: settings.lengthString,
                          ),
                        ),
                        //= Intensity Section
                        ExtremeRow.symmetric(
                          v: 5,
                          h: 15,
                          left: Text(
                            'Intensity'.toUpperCase(),
                            style: AppTextStyles.currentWorkoutSettingsData
                                .copyWith(color: AppColors.grey),
                          ),
                          right: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.help,
                                  size: 24, color: AppColors.grey),
                              constraints:
                                  BoxConstraints.tight(const Size(32, 32)),
                              onPressed: () {}),
                        ),
                        //= Intensity Choice
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: CupertinoSlidingSegmentedControl<String>(
                            children: Map.fromIterable(INTENSITY_STRINGS,
                                key: (key) => key.toString(),
                                value: (value) => Text(value.toString())),
                            onValueChanged: (newValue) {
                              settings.intensitySetAndSave(newValue);
                            },
                            groupValue: settings.intensityString,
                          ),
                        ),
                        //= Difficulty Section
                        ExtremeRow.symmetric(
                          v: 5,
                          h: 15,
                          left: Text(
                            'Difficulty'.toUpperCase(),
                            style: AppTextStyles.currentWorkoutSettingsData
                                .copyWith(color: AppColors.grey),
                          ),
                          right: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.help,
                                  size: 24, color: AppColors.grey),
                              constraints:
                                  BoxConstraints.tight(const Size(32, 32)),
                              onPressed: () {}),
                        ),
                        //= Difficulty Choice
                        Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          child: CupertinoSlidingSegmentedControl<String>(
                            children: Map.fromIterable(DIFFICULTY_STRINGS,
                                key: (key) => key.toString(),
                                value: (value) => Text(value.toString())),
                            onValueChanged: (newValue) {
                              settings.difficultySetAndSave(newValue);
                            },
                            groupValue: settings.difficultyString,
                          ),
                        ),
                        //= Impact Section
                        ExtremeRow.symmetric(
                          v: 5,
                          h: 15,
                          left: Text(
                            'Include impact'.toUpperCase(),
                            style: AppTextStyles.currentWorkoutSettingsData
                                .copyWith(color: AppColors.grey),
                          ),
                          right: Row(
                            children: <Widget>[
                              //= Impact choice
                              Switch.adaptive(
                                  value: settings.impact,
                                  onChanged: (value) {
                                    settings.impactSetOrToggleAndSave(value);
                                  }),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.help,
                                      size: 24, color: AppColors.grey),
                                  constraints:
                                      BoxConstraints.tight(const Size(32, 32)),
                                  onPressed: () {}),
                            ],
                          ),
                        ),
                        //= Equipment Section
                        ExtremeRow.symmetric(
                          v: 5,
                          h: 15,
                          left: Text(
                            'Equipment'.toUpperCase(),
                            style: AppTextStyles.currentWorkoutSettingsData
                                .copyWith(color: AppColors.grey),
                          ),
                          right: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.help,
                                  size: 24, color: AppColors.grey),
                              constraints:
                                  BoxConstraints.tight(const Size(32, 32)),
                              onPressed: () {}),
                        ),
                        //= Equipment Choice
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 5,
                          runSpacing: -3,
                          children: EQUIPMENT_DATA_KEYS
                              .map((key) => EquipmentChip(
                                  Equipment.equipmentFromKey(key),
                                  onSelected: (value) => value
                                      ? settings.addEquipment(key: key)
                                      : settings.removeEquipment(key: key)))
                              .toList(),
                        ),
                        //= End of sliver sections
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //= Main button
          Container(
            color: AppColors.greyDarkest,
            padding: const EdgeInsets.only(top: 20),
            child: PrimaryActionButton(
              text: 'preview / edit workout',
              buttonType: ButtonTypes.secondary,
              onTap: () => workoutService.generateCurrentWorkout().then((_) =>
                  Navigator.of(context).pushNamed(
                      FluroRouter.getWorkoutDetailsLink(
                          workoutKey: CURRENT_WORKOUT_KEY))),
            ),
          )
        ],
      );
}
