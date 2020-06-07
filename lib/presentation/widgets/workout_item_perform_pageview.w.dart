import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/core/utils.dart';
import '../../domain/models/exercise.dart';
import '../../domain/models/workout_item.dart';
import '../../domain/state/perform_store.dart';
import '../theme/colors.t.dart';
import 'workout_perform_exercise_details.w.dart';
import 'workout_perform_pageview_exercise_info.w.dart';
import 'workout_perform_pageview_menu.w.dart';

class WorkoutItemPerformPageView extends StatefulWidget {
  final int pageIndex;
  // final Future<void> Function({Duration duration, Curve curve}) goToNext;
  final PageController pageController;

  const WorkoutItemPerformPageView(
      {Key key,
      this.pageIndex,
      // this.goToNext,
      this.pageController})
      : super(key: key);

  @override
  _WorkoutItemPerformPageViewState createState() =>
      _WorkoutItemPerformPageViewState();
}

class _WorkoutItemPerformPageViewState
    extends State<WorkoutItemPerformPageView> {
  bool focus = false;
  bool started = false;
  bool done = false;
  bool paused = false;

  @override
  void initState() {
    super.initState();
  }

  /// Switch to next workout item
  void goToNext() => widget.pageController
      .nextPage(duration: const Duration(seconds: 1), curve: Curves.easeOut);

  /// Build
  @override
  Widget build(BuildContext context) {
    final PerformStore _performStore = Provider.of<PerformStore>(context);
    final WorkoutItem workoutItem =
        _performStore.workoutItems[widget.pageIndex];
    final Exercise exercise = workoutItem.exercise;
    final Exercise nextExercise =
        widget.pageIndex + 1 >= _performStore.workoutItems.length
            ? null
            : _performStore.workoutItems[widget.pageIndex + 1]?.exercise;

    /// generate the function to map progress bar animation values
    const double generalWidthPadding = 20.0;
    final double availablelWidth = MediaQuery.of(context).size.width;
    final int duration = _performStore.workoutItems[widget.pageIndex].duration;
    final mapProgressBarLength = generateMapper(
        inputStart: 0,
        inputEnd: duration.toDouble(),
        outputStart: generalWidthPadding * 2,
        outputEnd: availablelWidth - (generalWidthPadding * 2));

    /// reactions: Present workout item if is in initial state
    when(
        (_) =>
            _performStore.currentItemIndex == widget.pageIndex &&
            _performStore.currentItemStatus == WorkoutItemStatus.initial,
        () => _performStore.presentCurrentItem());

    /// reaction: Start performing workout item if is in ready state
    when(
        (_) =>
            _performStore.currentItemIndex == widget.pageIndex &&
            _performStore.currentItemStatus == WorkoutItemStatus.ready, () {
      _performStore.currentItemStatus = WorkoutItemStatus.started;
      if (!_performStore.performing) _performStore.performCurrentItem();
    });

    /// reaction: Switch to next workout item if item has been marked as done
    when(
        (_) =>
            _performStore.currentItemIndex == widget.pageIndex &&
            _performStore.currentItemStatus == WorkoutItemStatus.done &&
            !_performStore.performing, () {
      _performStore.currentItemStatus = WorkoutItemStatus.performed;
      if (!_performStore.currentItemIsLast) goToNext();
    });

    /// build return
    return Observer(
        builder: (context) => Container(
              padding: const EdgeInsets.only(
                  left: generalWidthPadding,
                  right: generalWidthPadding,
                  top: 15,
                  bottom: 40),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //= Exercise Details
                  WorkoutPerformPageViewExerciseDetails(
                    workoutItem: workoutItem,
                    exercise: exercise,
                    progress:
                        _performStore.workoutItems[widget.pageIndex].duration -
                            _performStore.currentItemProgress,
                  ),
                  //= Time Indicator
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: Stack(alignment: Alignment.centerLeft, children: [
                      AnimatedContainer(
                        alignment: Alignment.centerRight,
                        decoration: const BoxDecoration(
                            color: AppColors.coquelicot,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        height: 38,
                        width: mapProgressBarLength(_performStore
                            .workoutItems[widget.pageIndex].progress
                            .toDouble()),
                        duration: const Duration(seconds: 1),
                      )
                    ]),
                  ),
                  //= Next exercise row info
                  WorkoutPerformPageViewNextExerciseInfo(
                      nextExercise: nextExercise),
                  //= Menu Buttons
                  WorkoutPerformPageViewMenu(
                    moreInfo: () {},
                    replaceExercise: () {},
                    shuffleExercise: () =>
                        _performStore.shuffleCurrentItemsExercise(),
                    skipToNext: () {},
                  )
                ],
              ),
            ));
  }
}
