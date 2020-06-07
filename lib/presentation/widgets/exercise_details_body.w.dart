import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:native_video_view/native_video_view.dart';

import '../../domain/models/exercise.dart';
import '../theme/colors.t.dart';
import '../theme/text.t.dart';

class ExerciseDetailsBody extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsBody(
    this.exercise, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          width: double.infinity,
          height: 200,
          color: AppColors.coquelicot,
          child: NativeVideoView(
            keepAspectRatio: true,
            onCreated: (controller) => controller.setVideoSource(exercise.media,
                sourceType: VideoSourceType.asset),
            onPrepared: (controller, info) => controller.play(),
            onCompletion: (controller) async {
              await controller.seekTo(0);
              final bool currently = await controller.isPlaying();
              if (!currently) controller.play();
            },
          ),
          // const Image(
          //   image: AssetImage('assets/exercise_images/_default.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        DataRow(
            label: 'equipment',
            value: exercise.equipment,
            icon: exercise.equipmentIcon),
        DataRow(label: 'intensity', value: exercise.intensityString),
        DataRow(label: 'difficulty', value: exercise.difficultyString),
        const SizedBox(width: double.infinity, height: 15),
        MarkdownBody(
          data: exercise.description,
          styleSheet: markdownStyleSheet(context),
        )
      ],
    );
  }
}

class DataRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const DataRow(
      {Key key, @required this.label, @required this.value, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(bottom: 4),
        margin: const EdgeInsets.only(top: 4),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.grey))),
        child: Row(
          children: <Widget>[
            //= Label
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.greyDark,
              ),
            ),
            Expanded(child: Container()),
            //= Icon
            icon == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Icon(
                      icon,
                      color: AppColors.greyDarkest,
                      size: 20,
                    ),
                  ),
            //= Value
            Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyDark,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      );
}
