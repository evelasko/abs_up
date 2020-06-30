import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../interfaces/user_settings.i.dart';
import '../models/workout_settings.dart';

part 'settings_store.g.dart';

@lazySingleton
class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore(
    UserSettingsInterface settingsService,
  ) : super(settingsService);
}

abstract class _SettingsStore with Store {
  final UserSettingsInterface settingsService;

  _SettingsStore(this.settingsService) {
    workoutSettings = settingsService.workoutSettings;

    settingsService.registerWorkoutSettingsListener(
        () => workoutSettings = settingsService.workoutSettings);
  }

  @observable
  WorkoutSettings workoutSettings;

  @action
  bool checkEquipmentStatus(String equipmentKey) =>
      settingsService.workoutSettings.checkEquipmentStatusFor(equipmentKey);
}
