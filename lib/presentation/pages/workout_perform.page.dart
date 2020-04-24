import 'package:data_setup/domain/state/perform_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../domain/models/workout.dart';
import '../../domain/models/workout_item.dart';
import '../../domain/repositories/data_values.dart';
import '../../domain/repositories/i_hive_facade.dart';
import '../theme/colors.dart';
import '../widgets/workout_item_perform_pageview.dart';

/// Interface class to provide PerformStore
class WorkoutPerformPage extends StatelessWidget {
  final String workoutLogKey;
  const WorkoutPerformPage(
    this.workoutLogKey, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider(
        create: (_) => PerformStore(),
        child: WorkoutPerformLayout(workoutLogKey),
      );
}

/// Main layout class
class WorkoutPerformLayout extends StatefulWidget {
  final String workoutLogKey;
  const WorkoutPerformLayout(this.workoutLogKey);
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
    _performStore.initNew(widget.workoutLogKey);
  }

  void focusLocalizer() {
    final int current = _pageController.page.round();
    if (currentPage != current) {
      setState(() => currentPage = current);
      _performStore.updateCurrentItem(current);
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Performing workout'),
          flexibleSpace: Container(),
        ),
        backgroundColor: AppColors.greyDarkest,
        body: Column(
          children: <Widget>[
            // = General Progress Indicator
            Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 0, bottom: 0),
                  height: 10,
                  child: Row(
                    children: [
                      for (final item in _performStore.workoutItems)
                        item.exercise.name == 'Rest'
                            ? Container(
                                width: 10,
                                color: item.order - 1 == currentPage
                                    ? AppColors.brandeis
                                    : Colors.transparent)
                            : Expanded(
                                child: Container(
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('total time remaining'.toUpperCase(),
                            style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w600)),
                        Observer(builder: (_) {
                          return Text(
                            _performStore.timeRemainingString,
                            style: TextStyle(
                                color: AppColors.greyLight,
                                fontWeight: FontWeight.w800),
                          );
                        })
                      ],
                    ))
              ],
            ),
            Expanded(
              child: _performStore.workoutItems.isEmpty
                  ? const CircularProgressIndicator()
                  : PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: _performStore.workoutItems.length,
                      itemBuilder: (context, index) =>
                          WorkoutItemPerformPageView(pageIndex: index)),
            ),
          ],
        ),
      );
}
