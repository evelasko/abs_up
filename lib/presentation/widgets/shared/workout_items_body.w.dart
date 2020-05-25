import 'package:flutter/material.dart';

import '../../../domain/models/exercise.dart';
import '../../../domain/models/workout.dart';
import '../../../domain/models/workout_item.dart';
import '../../router/routes.dart';
import '../../theme/colors.t.dart';
import '../../theme/text.t.dart';
import 'wrappers.w.dart';

Widget exerciseTag(int tag) => tag == ExerciseTag.favorited.index
    ? const Icon(Icons.star, size: 13, color: Colors.limeAccent)
    : tag == ExerciseTag.blacklisted.index
        ? const Icon(Icons.thumb_down, size: 13, color: AppColors.coquelicot)
        : Container();

class WorkoutItemBody extends StatelessWidget {
  final WorkoutItem workoutItem;
  final Workout workout;
  const WorkoutItemBody(
      {Key key, @required this.workoutItem, @required this.workout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int itemIndex = workout.items.indexOf(workoutItem);

    return ListSmallItemWrapper(
      child: GestureDetector(
        // TODO on tapping a workout item should send to a bottom sheet view of the workout item...
        onTap: () => Navigator.pushNamed(
          context,
          FluroRouter.getWorkoutItemDetailsLink(
              workoutKey: workout.key.toString(), itemIndex: itemIndex),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
          color: workoutItem.exercise.name == 'Rest'
              ? AppColors.grey
              : AppColors.greyDark,
          key: Key('contentItem:${workoutItem.exercise.key}'),
          child: Row(
            children: <Widget>[
              //= Exercise Image
              Container(
                width: 70,
                height: 50,
                child: Stack(fit: StackFit.expand, children: [
                  // ignore: prefer_if_elements_to_conditional_expressions
                  workoutItem.exercise.name == 'Rest'
                      ? Container()
                      : const Image(
                          image:
                              AssetImage('assets/exercise_images/_default.jpg'),
                          fit: BoxFit.cover,
                        ),
                  //= Item Number Badge
                  Center(
                      child: Text(
                    workoutItem.order.toString(),
                    style: const TextStyle(
                        height: 1.05,
                        color: Colors.black38,
                        fontSize: 50,
                        fontWeight: FontWeight.w800),
                  ))
                ]),
              ),
              //= Exercise content
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //= Name
                            RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: workoutItem.exercise.name,
                                  style: AppTextStyles.listItemTitle
                                      .copyWith(fontSize: 14),
                                )),
                          ],
                        )),
                        Row(
                          children: <Widget>[
                            //= Target
                            Expanded(
                              child: Text(
                                workoutItem.exercise.target.toUpperCase(),
                                style: AppTextStyles.listItemUpperTitle
                                    .copyWith(color: AppColors.grey),
                              ),
                            ),
                            //= Duration Icon
                            const Padding(
                              padding: EdgeInsets.only(right: 4),
                              child: Icon(
                                Icons.timer,
                                color: AppColors.greyLightest,
                                size: 10,
                              ),
                            ),
                            //= Duration Data
                            Text(
                              '${workoutItem.duration} s',
                              style: AppTextStyles.listItemBottomInfo
                                  .copyWith(color: AppColors.greyLightest),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              //= Exercise equipment
              Container(
                width: 50,
                height: 50,
                child: Icon(workoutItem.exercise.equipmentIcon,
                    color: workoutItem.exercise.name == 'Rest'
                        ? AppColors.greyLight
                        : AppColors.grey,
                    size: 45.0),
              ),
              //= Reorder Handle
              Container(
                width: 24,
                margin: const EdgeInsets.only(right: 7),
                child: const Center(
                    child:
                        Icon(Icons.drag_handle, color: AppColors.greyDarkest)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
