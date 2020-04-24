import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/domain/state/perform_store.dart';

import '../../domain/models/workout_item.dart';
import '../theme/colors.dart';
import 'shared/buttons.dart';

class WorkoutItemPerformPageView extends StatefulWidget {
  final int pageIndex;
  final PageController pageController;

  const WorkoutItemPerformPageView({
    Key key,
    this.pageIndex,
    this.pageController,
  }) : super(key: key);

  @override
  _WorkoutItemPerformPageViewState createState() =>
      _WorkoutItemPerformPageViewState();
}

class _WorkoutItemPerformPageViewState
    extends State<WorkoutItemPerformPageView> {
  bool focus = false;
  bool started = false;
  bool paused = false;
  List<ReactionDisposer> _disposers;

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

    /// progress bas mapper
    const double generalWidthPadding = 20.0;
    final double availablelWidth = MediaQuery.of(context).size.width;
    final int duration = _performStore.workoutItems[widget.pageIndex].duration;
    double mapProgressBarLength(int progress) {
      final double slope =
          1 * (availablelWidth - (generalWidthPadding * 2)) / (duration - 0);
      final double output =
          (generalWidthPadding * 2) + (slope * (progress - 0)).round();
      return output;
      // itemProgress * (finalLength - initialLength) / 100;
    }

    /// reactions
    _disposers ??= [
      reaction((_) => _performStore.workoutItems[widget.pageIndex].progress,
          (int progress) {
        if (progress == duration) {}
      })
    ];

    /// build return
    return Container(
      padding: const EdgeInsets.only(
          left: generalWidthPadding,
          right: generalWidthPadding,
          top: 15,
          bottom: 40),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //= Exercise Details
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Observer(
                builder: (context) => Row(
                  children: <Widget>[
                    Text(
                        'current item index: ${_performStore.currentItemIndex},'),
                    Text(
                        ' p: ${_performStore.workoutItems[widget.pageIndex].progress},'),
                    Text(
                        ' d: ${_performStore.workoutItems[widget.pageIndex].duration},'),
                    Text(' c: ${_performStore.currentItemProgress}'),
                    Text(
                      mapProgressBarLength(_performStore
                              .workoutItems[widget.pageIndex].progress)
                          .toString(),
                      style: TextStyle(fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ),
              MaterialButton(
                textColor: Colors.black,
                onPressed: () => !_performStore.performing
                    ? _performStore.performCurrentItem()
                    : _performStore.stopCurrentTimer(),
                child: Text(
                    'start/stop (progress: ${_performStore.currentItemProgress})'),
              ),
              // = Exercise Header
              RichText(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    text: workoutItem.exercise.name,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: AppColors.greyDarkest,
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
              ),
              // = Exercise info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text('intensity: '),
                      Text(exercise.intensityString)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Text('difficulty: '),
                      Text(exercise.difficultyString)
                    ],
                  )
                ],
              ),
              //= Image
              Container(
                width: double.maxFinite,
                height: 200,
                color: AppColors.coquelicot,
              ),
              // = Exercise Equipment Row
              Container(
                height: 84,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                            color: AppColors.greyLightest,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: Center(
                            child: Icon(
                          exercise.equipmentIcon,
                          size: 65,
                        )),
                      ),
                    ),
                    // = Interval Count
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 2),
                        decoration: BoxDecoration(
                            color: AppColors.greyLightest,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        child: Center(
                          child: Text(
                            '1/1',
                            style: TextStyle(
                                fontSize: 42,
                                color: AppColors.greyDark,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          //= Time Indicator
          Container(
            width: double.infinity,
            height: 40,
            child: Stack(alignment: Alignment.centerLeft, children: [
              Observer(builder: (context) {
                return AnimatedContainer(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        color: AppColors.coquelicot,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))),
                    height: 38,
                    width: mapProgressBarLength(
                        _performStore.workoutItems[widget.pageIndex].progress),
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear,
                    child:
                        Text((_performStore.currentItemProgress).toString()));
              }),
            ]),
          ),

          //= Next exercise row info
          Row(
            children: <Widget>[
              Text('Next'.toUpperCase()),
              Expanded(
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: nextExercise != null
                          ? nextExercise.name
                          : 'End of Workout',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: AppColors.greyDarkest,
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                ),
              ),
              Container(
                height: 39,
                width: 39,
                child: nextExercise != null
                    ? Icon(nextExercise.equipmentIcon,
                        size: 38, color: AppColors.grey)
                    : Container(),
              )
            ],
          ),
          //= Menu Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AppButtons.boxedSmallIconButton(
                  onTap: () {},
                  icon: Icons.info_outline,
                  text: 'info',
                  buttonType: ButtonTypes.other),
              AppButtons.boxedSmallIconButton(
                  onTap: () {},
                  icon: Icons.swap_horiz,
                  text: 'replace',
                  buttonType: ButtonTypes.other),
              AppButtons.boxedSmallIconButton(
                  onTap: () {},
                  icon: Icons.shuffle,
                  text: 'shuffle',
                  buttonType: ButtonTypes.secondary),
              AppButtons.boxedSmallIconButton(
                  onTap: () {},
                  icon: Icons.skip_next,
                  text: 'skip',
                  buttonType: ButtonTypes.primary)
            ],
          )
        ],
      ),
    );
  }
}
