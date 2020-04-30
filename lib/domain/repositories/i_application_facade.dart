import 'package:abs_up/domain/repositories/i_exercise_facade.dart';
import 'package:abs_up/domain/repositories/i_user_settings_facade.dart';
import 'package:abs_up/domain/repositories/i_workout_facade.dart';

class IApplicationFacade {
  Future<bool> initApplication() async {
    await IExerciseFacade().fetchLocalExercises();
    await IUserSettingsFacade.initUserSettings();
    await IWorkoutFacade.initWorkoutSettings();
    await IWorkoutFacade.generateCurrentWorkout();
    return true;
  }
}
