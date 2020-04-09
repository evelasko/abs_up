//: Data model: User Settings

class UserSettings {
  static const String userId = 'userId';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String presentationWatched = 'presentationWatched';
  static const String progressStartDate = 'progressStartDate';
  static const String weightMeasure = 'weightMeasure';
  static const String workoutSettings = 'workoutSettings';
  static const String favoriteExercises = 'favoriteExercises';
  static const String blacklistExercises = 'blacklistExercises';

  // final String userId;
  // final String firstName;
  // final String lastName;
  // final bool presentationWatched;
  // final DateTime progressStartDate;
  // final String weightMeasure;
  // final WorkoutSettings workoutSettings;
  // final List<String> favoriteExercises;
  // final List<String> blacklistExercises;

  // UserSettings({
  //   this.userId,
  //   this.firstName,
  //   this.lastName,
  //   this.presentationWatched,
  //   this.progressStartDate,
  //   this.workoutSettings,
  //   this.weightMeasure,
  //   this.favoriteExercises,
  //   this.blacklistExercises,
  // });

  // UserSettings get defaultUserSettings {
  //   return UserSettings(
  //       userId: '',
  //       firstName: 'Guest',
  //       lastName: '',
  //       presentationWatched: false,
  //       progressStartDate: DateTime.now(),
  //       weightMeasure: 'kg',
  //       workoutSettings: WorkoutSettings('short', 1, 1, ['none']));
  // }

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;
  //   return o is UserSettings &&
  //       o.userId == userId &&
  //       o.firstName == firstName &&
  //       o.lastName == lastName &&
  //       o.presentationWatched == presentationWatched &&
  //       o.progressStartDate == progressStartDate &&
  //       o.weightMeasure == weightMeasure &&
  //       o.favoriteExercises.length == favoriteExercises.length &&
  //       o.blacklistExercises.length == blacklistExercises.length;
  // }

  // @override
  // int get hashCode => super.hashCode;
}

class WorkoutSettings {
  final String length;
  final int intensity;
  final int difficulty;
  final List<String> equipment;

  WorkoutSettings(this.length, this.intensity, this.difficulty, this.equipment);
}
