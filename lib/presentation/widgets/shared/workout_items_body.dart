import 'package:data_setup/domain/models/workout_item.dart';
import 'package:data_setup/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/exercise.dart';
import '../../theme/colors.dart';
import '../../theme/text.dart';
import 'wrappers.dart';

Widget exerciseTag(int tag) => tag == ExerciseTag.favorited.index
    ? Icon(Icons.star, size: 13, color: Colors.limeAccent)
    : tag == ExerciseTag.blacklisted.index
        ? Icon(Icons.thumb_down, size: 13, color: AppColors.coquelicot)
        : Container();

/// Renders Workout Item Body Content
Widget workoutItemBody(BuildContext context, WorkoutItem workoutItem) =>
    listSmallItemWrapper(
      GestureDetector(
        // TODO on tapping a workout item should send to a bottom sheet view of the workout item...
        onTap: () => Navigator.pushNamed(
            context,
            FluroRouter.getExerciseDetailsLink(
                exerciseKey: workoutItem.exercise.key.toString())),
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 0, top: 5, bottom: 5),
          color: workoutItem.exercise.name == 'Rest'
              ? AppColors.greyLight
              : Colors.white,
          key: Key('contentItem:${workoutItem.exercise.key}'),
          child: Row(
            children: <Widget>[
              //= Exercise Image
              Container(
                width: 70,
                height: 50,
                child: Stack(fit: StackFit.expand, children: [
                  workoutItem.exercise.name == 'Rest'
                      ? Container()
                      : Image(
                          image:
                              AssetImage('assets/exercise_images/_default.jpg'),
                          fit: BoxFit.cover,
                        ),
                  Center(
                      child: Text(
                    workoutItem.order.toString(),
                    style: TextStyle(
                        height: 1.05,
                        color: Colors.white60,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Icon(
                                Icons.timer,
                                color: AppColors.coquelicot,
                                size: 10,
                              ),
                            ),
                            //= Duration Data
                            Text(
                              '${workoutItem.duration} s',
                              style: AppTextStyles.listItemBottomInfo
                                  .copyWith(color: AppColors.coquelicot),
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
                margin: EdgeInsets.only(right: 10),
                child: Center(
                    child: Icon(Icons.drag_handle, color: AppColors.greyDark)),
              )
            ],
          ),
        ),
      ),
    );
