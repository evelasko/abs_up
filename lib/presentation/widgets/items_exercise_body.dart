import 'package:flutter/material.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_user_settings_facade.dart';
import '../theme/colors.dart';
import '../theme/text.dart';
import 'wrappers.dart';

Widget exerciseTag(String key) => IUserSettingsFacade.isFavorite(key)
    ? Icon(Icons.star, size: 13, color: Colors.limeAccent)
    : IUserSettingsFacade.isBlacklist(key)
        ? Icon(Icons.thumb_down, size: 13, color: AppColors.coquelicot)
        : Container();

/// Renders Exercise List Item Body Content
Widget exerciseItemBody(String key, Exercise exercise) => listItemWrapper(
      GestureDetector(
        onTap: () => print(key),
        child: Card(
          color: Colors.transparent,
          elevation: 0,
          key: Key(key),
          child: Row(
            children: <Widget>[
              //= Exercise Image
              // IUserSettingsFacade.isFavorite(key) ?
              Container(
                width: 70,
                height: 70,
                color: Colors.blue,
                child: Stack(fit: StackFit.expand, children: [
                  Image(
                    image: AssetImage('assets/exercise_images/_default.jpg'),
                    fit: BoxFit.cover,
                  ),
                  Positioned(top: 4, left: 4, child: exerciseTag(key))
                ]),
              ),
              //= Exercise content
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              exercise.target.toUpperCase(),
                              style: AppTextStyles.listItemUpperTitle,
                            ),
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
