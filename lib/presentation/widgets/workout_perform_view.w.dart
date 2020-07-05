import 'package:abs_up/domain/state/perform_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../domain/state/perform_store.dart';
import '../../injection.dart';
import '../theme/colors.t.dart';
import 'shared/workout_perform_dialogs.w.dart';
import 'shared/workout_perform_general_indicator.w.dart';
import 'workout_item_perform_pageview.w.dart';

class WorkoutPerformView extends StatefulWidget {
  const WorkoutPerformView();
  @override
  _WorkoutPerformViewState createState() => _WorkoutPerformViewState();
}

class _WorkoutPerformViewState extends State<WorkoutPerformView> {
  final PerformStore _performStore = getIt.get<PerformStore>();

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() =>
        _performStore.changeCurrentItemIndex(_pageController.page.round()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    //= Reaction: when the current item is the last one and has been performed
    //= Do: (_finishWorkout) show final dialog
    // TODO !!! register this action in the store
    when(
        (_) =>
            _performStore.currentItemIsLast &&
            _performStore.items[_performStore.itemIndex].status ==
                PerformingItemStatus.performed,
        _finishWorkout);
  }

  Future<bool> _finishWorkout() async =>
      (await showDialog(
          context: context,
          builder: (context) =>
              FinishWorkoutDialog(performStore: _performStore))) ??
      false;

  Future<bool> _onWillPop() async {
    await _performStore.prepareToAbandonWorkout(silently: true);
    return (await showDialog(
            context: context,
            builder: (context) =>
                AbandonWorkoutDialog(performStore: _performStore))) ??
        false;
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: _onWillPop,
        child: Observer(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Performing workout'),
                // = General workout controller (pause/fforward/resume)
                actions: <Widget>[
                  _performStore.state == PerformState.performing
                      ? IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: () => _performStore.pause())
                      : _performStore.items[_performStore.itemIndex].status ==
                              PerformingItemStatus.presenting
                          ? IconButton(
                              icon: const Icon(Icons.fast_forward),
                              onPressed: () {
                                _performStore.goToNextItem();
                              },
                            )
                          : IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () =>
                                  _performStore.performCurrentItem(),
                            ),
                ],
              ),
              backgroundColor: AppColors.greyDarkest,
              body: Column(
                children: <Widget>[
                  // = General Progress Indicator
                  WorkoutPerformGeneralIndicator(
                    workoutItems: _performStore.items,
                    currentPage: _performStore.itemIndex,
                    timeRemainingString: _performStore.timeRemainingString,
                  ),
                  // = Workout Items Page View
                  Expanded(
                    child: _performStore.items.isEmpty
                        ? const CircularProgressIndicator()
                        : PageView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            itemCount: _performStore.items.length,
                            itemBuilder: (context, index) =>
                                WorkoutItemPerformPageView(
                                  pageIndex: index,
                                  pageController: _pageController,
                                )),
                  ),
                ],
              )),
        ),
      );
}
