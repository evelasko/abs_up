import 'package:flutter/material.dart';

import '../../../domain/models/perform_item.dart';
import '../../theme/colors.t.dart';

class WorkoutPerformGeneralIndicator extends StatelessWidget {
  final List<PerformItem> workoutItems;
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
