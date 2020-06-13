import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/state/perform_store.dart';
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
  PerformStore _performStore;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(
        () => _performStore.switchCurrentItem(_pageController.page.round()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _performStore ??= Provider.of<PerformStore>(context);

    //= Reaction: when the current item is the last one and has been performed
    //= Do: (_finishWorkout) show final dialog
    when(
        (_) =>
            _performStore.currentItemIsLast &&
            _performStore.currentItemStatus == WorkoutItemStatus.performed,
        _finishWorkout);
  }

  Future<bool> _finishWorkout() async =>
      (await showDialog(
          context: context,
          builder: (context) =>
              FinishWorkoutDialog(performStore: _performStore))) ??
      false;

  Future<bool> _onWillPop() async {
    _performStore.stopCurrentTimer();
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
    _performStore.dispose();
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
                  _performStore.performing
                      ? IconButton(
                          icon: const Icon(Icons.pause),
                          onPressed: () => _performStore.stopCurrentTimer())
                      : _performStore.currentItemStatus ==
                              WorkoutItemStatus.presenting
                          ? IconButton(
                              icon: const Icon(Icons.fast_forward),
                              onPressed: () {
                                _performStore.stopSpeech();
                                _performStore.currentItemStatus =
                                    WorkoutItemStatus.ready;
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
                    workoutItems: _performStore.workoutItems,
                    currentPage: _performStore.currentItemIndex,
                    timeRemainingString: _performStore.timeRemainingString,
                  ),
                  // = Workout Items Page View
                  Expanded(
                    child: _performStore.workoutItems.isEmpty
                        ? const CircularProgressIndicator()
                        : PageView.builder(
                            controller: _pageController,
                            itemCount: _performStore.workoutItems.length,
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
