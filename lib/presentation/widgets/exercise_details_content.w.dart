import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../domain/models/exercise.dart';
import '../theme/colors.t.dart';
import '../theme/text.t.dart';

class ExerciseDetailsContent extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsContent(
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
          child: const Image(
            image: AssetImage('assets/exercise_images/_default.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        DataRow(
            label: 'equipment',
            value: exercise.equipment,
            icon: exercise.equipmentIcon),
        DataRow(label: 'intensity', value: exercise.intensityString),
        DataRow(label: 'difficulty', value: exercise.difficultyString),
        const SizedBox(width: double.infinity, height: 15),
        FutureBuilder(
            initialData: 'loading details',
            future: rootBundle.loadString("assets/exercise_details/default.md"),
            builder: (context, snapshot) => snapshot.hasData
                ? MarkdownBody(
                    data: snapshot.data.toString(),
                    styleSheet: markdownStyleSheet(context),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ))
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
