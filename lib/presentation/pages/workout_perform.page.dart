import 'package:abs_up/domain/state/perform_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/state/perform_store.dart';
import '../../injection.dart';
import '../widgets/workout_perform_view.w.dart';
import '../widgets/workout_perform_welcome.w.dart';

/// Interface class to provide PerformStore
class WorkoutPerformPage extends StatelessWidget {
  final String sourceWorkoutKey;
  const WorkoutPerformPage(
    this.sourceWorkoutKey, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PerformStore performStore = getIt.get<PerformStore>();
    performStore
      ..initializePerformanceOf(sourceWorkoutKey ?? CURRENT_WORKOUT_KEY)
      ..welcomeWorkout();

    return Observer(
      builder: (BuildContext context) => AnimatedCrossFade(
        firstChild: WorkoutPerformWelcome(
          duration: performStore.timeRemainingString,
          equipmentIcons: Set<IconData>.from(performStore.items
                  ?.map((wItem) => wItem.exercise.equipmentIcon)).toList() ??
              [],
        ),
        secondChild: const WorkoutPerformView(),
        layoutBuilder: (
          Widget top,
          Key topKey,
          Widget bottom,
          Key bottomKey,
        ) =>
            Stack(
          children: [
            Positioned.fill(key: bottomKey, child: bottom),
            Positioned.fill(key: topKey, child: top),
          ],
        ),
        crossFadeState: performStore.state == PerformState.welcoming
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
