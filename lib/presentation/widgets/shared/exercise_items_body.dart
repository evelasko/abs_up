import 'package:abs_up/presentation/router/routes.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/exercise.dart';
import '../../theme/colors.t.dart';
import '../../theme/text.t.dart';
import 'wrappers.dart';

Widget exerciseTag(int tag) => tag == ExerciseTag.favorited.index
    ? const Icon(Icons.star, size: 13, color: Colors.limeAccent)
    : tag == ExerciseTag.blacklisted.index
        ? const Icon(Icons.thumb_down, size: 13, color: AppColors.coquelicot)
        : Container();

/// Renders Exercise List Item Body Content
Widget exerciseItemBody(BuildContext context, Exercise exercise) =>
    listItemWrapper(
      GestureDetector(
        onTap: () => Navigator.pushNamed(
            context,
            FluroRouter.getExerciseDetailsLink(
                exerciseKey: exercise.key.toString())),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          key: Key('contentItem:${exercise.key}'),
          child: Row(
            children: <Widget>[
              //= Exercise Image
              // IUserSettingsFacade.isFavorite(key) ?
              Container(
                width: 70,
                height: 70,
                color: Colors.blue,
                child: Stack(fit: StackFit.expand, children: [
                  const Image(
                    image: AssetImage('assets/exercise_images/_default.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Positioned(top: 4, left: 4, child: exerciseTag(exercise.tag))
                ]),
              ),
              //= Exercise content
              Expanded(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //= Target
                            Text(
                              exercise.target.toUpperCase(),
                              style: AppTextStyles.listItemUpperTitle,
                            ),
                            //= Name
                            RichText(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                text: TextSpan(
                                  text: exercise.name,
                                  style: AppTextStyles.listItemTitle,
                                )),
                          ],
                        )),
                        Row(
                          // TODO Implement exercise item intensity level indicator
                          children: <Widget>[
                            Text(exercise.intensityString.toUpperCase(),
                                style: AppTextStyles.listItemBottomInfo),
                            Text(exercise.difficultyString.toUpperCase(),
                                style: AppTextStyles.listItemBottomInfo),
                          ],
                        ),
                      ],
                    )),
              ),
              //= Exercise equipment
              Container(
                width: 70,
                height: 70,
                child: Column(
                  children: <Widget>[
                    Icon(exercise.equipmentIcon,
                        color: AppColors.grey, size: 44.0),
                    Expanded(
                      child: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: exercise.equipment
                                  .toUpperCase()
                                  .replaceAll(' ', '\n'),
                              style: AppTextStyles.listItemBottomInfo)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
