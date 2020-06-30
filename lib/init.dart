import 'package:abs_up/domain/models/workout.dart';
import 'package:abs_up/domain/models/workout_item.dart';
import 'package:abs_up/domain/models/workout_log.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'config.dart';
import 'constants.dart';
import 'domain/models/exercise.dart';
import 'domain/state/auth_store.dart';
import 'injection.dart';
import 'presentation/router/routes.dart';

Future<bool> initializeAbsUp() async {
  //= Load configuration from JSON
  await Config.initialize();

  //= Register injectable dependencies
  configureInjection(Environment.prod);

  //= Initialize injectable dependencies
  try {
    await getIt.allReady(timeout: const Duration(seconds: 5));
  } on WaitingTimeOutException {
    print('timeout exceeded');
    // TODO implement proper error handling here
  }

  //= Initialize current authenticated user
  await getIt.get<AuthStore>().authCheck();
  print('on to routed');
  //= Init Fluro Routes
  FluroRouter.setupRouter();
  return true;
}

Future<void> initializeHive() async {
  final documentsDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentsDirectory.path);

  Hive.registerAdapter<Exercise>(ExerciseAdapter());
  Hive.registerAdapter<WorkoutSettings>(WorkoutSettingsAdapter());
  Hive.registerAdapter<WorkoutItem>(WorkoutItemAdapter());
  Hive.registerAdapter<Workout>(WorkoutAdapter());
  Hive.registerAdapter<WorkoutLog>(WorkoutLogAdapter());

  await Hive.openBox<Exercise>(EXERCISE_BOX_NAME);
  await Hive.openBox<WorkoutSettings>(WORKOUT_SETTINGS_BOX_NAME);
  await Hive.openBox(USER_SETTINGS_BOX_NAME);
  await Hive.openBox<Workout>(WORKOUTS_BOX_NAME);
  await Hive.openBox<WorkoutLog>(WORKOUT_LOGS_BOX_NAME);
}
