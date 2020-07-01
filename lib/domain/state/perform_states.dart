import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/domain/models/workout_item.dart';

enum WorkoutItemStatus {
  initial,
  presenting,
  ready,
  started,
  paused,
  done,
  performed
}
enum PerformState {
  idle,
  loading,
  welcoming,
  initial,
  presenting,
  started,
  paused
}
