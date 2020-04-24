import 'dart:async';

import 'package:mobx/mobx.dart';

import '../models/workout.dart';
import '../models/workout_item.dart';
import '../repositories/i_hive_facade.dart';

part 'perform_store.g.dart';

class PerformStore extends _PerformStore with _$PerformStore {}

enum PerformState { loading, initial, started, paused, idle }

abstract class _PerformStore with Store {
  @observable
  String workoutLogKey;
  @observable
  PerformState state;
  @observable
  List<WorkoutItem> workoutItems;
  @observable
  Duration overallDuration;
  @observable
  Duration timeRemaining;
  @computed
  String get timeRemainingString =>
      RegExp(r'\d{2}\:\d{2}(?=\.)').stringMatch(timeRemaining.toString()) ??
      '00:00';

  @observable
  int currentItemIndex;
  @observable
  WorkoutItem currentItem;
  @observable
  int currentItemProgress;

  @action
  void _incrementCurrentItemProgressByOneUnit() {
    workoutItems[currentItemIndex].progress += 1;
    timeRemaining -= const Duration(seconds: 1);
    currentItemProgress = workoutItems[currentItemIndex].progress;
  }

  @observable
  Timer currentTimer;
  @observable
  bool performing = false;

  @action
  void performCurrentItem() =>
      Timer.periodic(const Duration(seconds: 1), (timer) {
        if (workoutItems[currentItemIndex].progress ==
            workoutItems[currentItemIndex].duration) {
          timer.cancel();
          performing = false;
          return;
        }
        print('adding one');
        performing = true;
        currentTimer = timer;
        _incrementCurrentItemProgressByOneUnit();
      });

  @action
  void stopCurrentTimer() {
    currentTimer?.cancel();
    performing = false;
  }

  @action
  void updateCurrentItem(int itemIndex) {
    currentItemIndex = itemIndex;
    currentItem = workoutItems[itemIndex];
    currentItemProgress = currentItem.progress;
  }

  /// Initialize state for new workout to perform
  @action
  Future<void> initNew(String newWorkoutLogKey) async {
    if (workoutLogKey == newWorkoutLogKey) return;
    state = PerformState.loading;
    final Workout workoutBlueprint =
        IHiveFacade.workoutLogsBox.get(newWorkoutLogKey);

    overallDuration = Duration(seconds: 0);
    for (final item in workoutBlueprint.items) {
      overallDuration += Duration(seconds: item.duration);
    }
    timeRemaining = overallDuration;

    workoutItems = workoutBlueprint.items;
    currentItemIndex = 0;
    currentItemProgress = 0;
    workoutLogKey = newWorkoutLogKey;
    state = PerformState.initial;
  }
}
