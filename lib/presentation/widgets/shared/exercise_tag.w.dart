import 'package:abs_up/domain/models/exercise.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';

class ExerciseTagWidget extends StatelessWidget {
  final int tag;
  const ExerciseTagWidget(
    this.tag, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => tag == ExerciseTag.favorited.index
      ? const Icon(Icons.star, size: 13, color: Colors.limeAccent)
      : tag == ExerciseTag.blacklisted.index
          ? const Icon(Icons.thumb_down, size: 13, color: AppColors.coquelicot)
          : Container();
}
