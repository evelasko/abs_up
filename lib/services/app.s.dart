import 'package:abs_up/services/user_settings.s.dart';

import 'exercise.s.dart';
import 'workout.s.dart';

class ApplicationServices {
  Future<bool> initApplication() async {
    await ExerciseService().fetchLocalExercises();
    await UserSettingsService.initUserSettings();

    final workoutService = WorkoutService();
    await workoutService
        .initWorkoutSettings()
        .then((_) => workoutService.generateCurrentWorkout());
    // await workoutService.generateCurrentWorkout();
    return true;
  }
}
