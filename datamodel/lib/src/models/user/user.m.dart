import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import '../workout_log/workout_log.m.dart';
import '../workout_settings/workout_settings.m.dart';

part 'user.m.flamingo.dart';

class User extends Document<User> {
  @Field()
  String displayName;
  @ModelField()
  WorkoutSettings workoutSettings;
  @SubCollection()
  Collection<WorkoutLog> workoutLog;

  User({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
    CollectionReference collectionRef,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef: collectionRef,
        ) {
    workoutLog = Collection(this, UserKey.workoutLog.value);
  }

  @override
  Map<String, dynamic> toData() => _$toData(this);
  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
