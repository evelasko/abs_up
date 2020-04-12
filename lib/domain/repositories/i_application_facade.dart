import 'package:data_setup/domain/repositories/i_exercise_facade.dart';
import 'package:data_setup/domain/repositories/i_user_settings_facade.dart';
import 'package:data_setup/domain/repositories/i_workout_settings_facade.dart';

class IApplicationFacade {
  Future<bool> initApplication() async {
    await IExerciseFacade().fetchLocalExercises();
    await IUserSettingsFacade.initUserSettings();
    await IWorkoutSettingsFacade.initWorkoutSettings();
    return true;
  }
}
