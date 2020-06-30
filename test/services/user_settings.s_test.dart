import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:abs_up/services/user_settings.s.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';

import '../helpers/test_helpers.dart';

void main() {
  final BoxWSMock<WorkoutSettings> workoutSettingsBox =
      BoxWSMock<WorkoutSettings>();
  final UserSettingsService userSettingsService =
      UserSettingsService(workoutSettingsBox);

  group('Service: User Settings', () {
    test('should return an instance of userSettingsService', () async {
      //= arrange
      when(workoutSettingsBox.isEmpty).thenReturn(true);
      //= act
      final UserSettingsService instance =
          await UserSettingsService.init(workoutSettingsBox);
      //= assert
      verify(workoutSettingsBox.isEmpty);
      expect(instance.runtimeType.toString(), 'UserSettingsService');
    });
    // test('should return the currently saved workout settings', () {
    //   when(workoutSettingsBox.get(WORKOUT_SETTINGS_KEY,
    //           defaultValue: WorkoutSettings()))
    //       .thenReturn(WorkoutSettings());
    //   //= act
    //   final WorkoutSettings settings = userSettingsService.workoutSettings;
    //   //= assert
    //   expect(settings.runtimeType.toString(), 'WorkoutSettings');
    // });

    // test('should reset workout settings to defaults', () async {
    //   //= act
    //   await userSettingsService.resetWorkoutSettings();
    //   //= assert
    //   verify(workoutSettingsBox.put);
    // });
    // test('should rewrite an entire workoutsettings value', () async {
    //   //= act
    //   await userSettingsService.setWorkoutSettings(WorkoutSettings());
    //   await userSettingsService.setWorkoutSettings(null);
    //   //= assert
    //   verify(workoutSettingsBox.put).called(2);
    // });
  });
}
