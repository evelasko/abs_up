import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../../domain/models/workout_item.dart';
import '../../domain/state/perform_store.dart';
import '../../services/speech.s.dart';
import '../theme/colors.t.dart';
import '../widgets/shared/buttons.w.dart';
import '../widgets/shared/modal_dialog.w.dart';
import '../widgets/workout_item_perform_pageview.w.dart';

/// Interface class to provide PerformStore
class WorkoutPerformPage extends StatelessWidget {
  final String sourceWorkoutKey;
  const WorkoutPerformPage(
    this.sourceWorkoutKey, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider<PerformStore>(
        create: (_) => PerformStore(SpeechService()),
        child: WorkoutPerformLayout(sourceWorkoutKey),
      );
}

/// Main layout class
class WorkoutPerformLayout extends StatefulWidget {
  final String sourceWorkoutKey;
  const WorkoutPerformLayout(this.sourceWorkoutKey);
  @override
  _WorkoutPerformLayoutState createState() => _WorkoutPerformLayoutState();
}

class _WorkoutPerformLayoutState extends State<WorkoutPerformLayout> {
  PerformStore _performStore;
  PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(focusLocalizer);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _performStore ??= Provider.of<PerformStore>(context);
    _performStore.initNew(widget.sourceWorkoutKey ?? CURRENT_WORKOUT_KEY);
    when(
        (_) =>
            _performStore.currentItemIsLast &&
            _performStore.currentItemStatus == WorkoutItemStatus.performed,
        _finishWorkout);
  }

  void focusLocalizer() {
    final int current = _pageController.page.round();
    if (currentPage != current) {
      setState(() => currentPage = current);
      _performStore.switchCurrentItem(current);
    }
  }

  Future<bool> _finishWorkout() async =>
      (await showDialog(
          context: context,
          builder: (context) => AbsAppModalDialog(
                title: 'WORKOUT\nFINISHED',
                decoration:
                    const BoxDecoration(gradient: AppColors.primaryGradient),
                buttons: <Widget>[
                  SecondaryActionButton(
                      text: 'Home',
                      icon: Icons.home,
                      onTap: () => _performStore.saveWorkoutLogEntry().then(
                          (value) =>
                              Navigator.popAndPushNamed(context, HOME_LINK))),
                  SecondaryActionButton(
                      buttonType: ButtonTypes.secondary,
                      text: 'Share progress',
                      icon: Icons.share,
                      onTap: () =>
                          _performStore.saveWorkoutLogEntry().then((value) {
                            // TODO implement sharing progress when finishing workout
                            Navigator.popAndPushNamed(context, HOME_LINK);
                          }))
                ],
              ))) ??
      false;

  Future<bool> _onWillPop() async {
    _performStore.stopCurrentTimer();
    await _performStore.prepareToAbandonWorkout(silently: true);
    return (await showDialog(
            context: context,
            builder: (context) => AbsAppModalDialog(
                  title: 'EXIT\nWORKOUT',
                  buttons: <Widget>[
                    SecondaryActionButton(
                        text: 'Yes! Take me out',
                        onTap: () {
                          _performStore.abandonWorkout();
                          Navigator.of(context).pop(true);
                        }),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    PrimaryActionButton(
                        text: 'No! Keep me in',
                        onTap: () => Navigator.of(context).pop(false)),
                  ],
                ))) ??
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
                    currentPage: currentPage,
                    timeRemainingString: _performStore.timeRemainingString,
                  ),
                  // = Workout Items Page View
                  Expanded(
                    child: _performStore.workoutItems.isEmpty
                        ? const CircularProgressIndicator()
                        : PageView.builder(
                            scrollDirection: Axis.horizontal,
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

/// General Workout Indicator
class WorkoutPerformGeneralIndicator extends StatelessWidget {
  final List<WorkoutItem> workoutItems;
  final String timeRemainingString;
  final int currentPage;

  const WorkoutPerformGeneralIndicator({
    Key key,
    @required this.workoutItems,
    @required this.currentPage,
    @required this.timeRemainingString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          height: 10,
          child: Row(
            children: [
              for (final item in workoutItems)
                item.exercise.name == 'Rest'
                    ? Container(
                        width: 12,
                        color: item.order - 1 == currentPage
                            ? AppColors.brandeis
                            : Colors.transparent)
                    : Expanded(
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            color: item.order - 1 == currentPage
                                ? AppColors.coquelicot
                                : item.progress == 0
                                    ? AppColors.greyDark
                                    : AppColors.grey),
                      ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('total time remaining'.toUpperCase(),
                    style: const TextStyle(
                        color: AppColors.grey, fontWeight: FontWeight.w600)),
                Text(
                  timeRemainingString,
                  style: const TextStyle(
                      color: AppColors.greyLight, fontWeight: FontWeight.w800),
                )
              ],
            ))
      ],
    );
  }
}
