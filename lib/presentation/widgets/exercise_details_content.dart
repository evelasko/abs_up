import 'package:data_setup/domain/models/exercise.dart';
import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
        Container(margin: EdgeInsets.all(15), color: AppColors.coquelicot),
        dataRow('equipment', exercise.equipment),
        dataRow('intensity', exercise.intensityString),
        dataRow('difficulty', exercise.difficultyString),
        Table(
          children: [
            TableRow(children: [
              Container(
                width: 120,
                height: 120,
                color: AppColors.coquelicot,
              ),
              Container(
                width: 120,
                height: 120,
                color: AppColors.coquelicot,
              )
            ])
          ],
        ),
        FutureBuilder(
            initialData: 'loading details',
            future: rootBundle.loadString("assets/exercise_details/default.md"),
            builder: (context, snapshot) => snapshot.hasData
                ? Container(
                    child: MarkdownBody(
                    data: snapshot.data,
                    styleSheet: markdownStyleSheet(context),
                  ))
                : Center(
                    child: CircularProgressIndicator(),
                  ))
      ],
    );
  }
}

Widget dataRow(String label, String value) => Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColors.greyLight))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[Text(label.toUpperCase()), Text(value)],
      ),
    );
