import 'package:data_setup/domain/repositories/i_exercise_facade.dart';

class IApplicationFacade {
  Future<bool> initApplication() async {
    // final openedBoxes = await IHiveFacade().openHiveBoxes();
    await IExerciseFacade().fetchLocalExercises();
    return true;
  }
}
