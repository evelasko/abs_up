import 'package:flutter/material.dart';

import '../../domain/models/exercise.dart';
import '../router/routes.dart';
import 'exercise_items_body.w.dart';
import 'shared/swipable_actions.w.dart';

/// Exercise Item Widget Class
class ExerciseItem extends StatelessWidget {
  final Exercise exercise;
  final bool isDismissible;
  const ExerciseItem({
    Key key,
    @required this.exercise,
    this.isDismissible = false,
  }) : super(key: key);

  Future<bool> _addToFavoriteOrBlacklist(DismissDirection direction) async {
    //= add to favorites
    if (direction == DismissDirection.startToEnd) {
      await exercise.setFavorite();
    }
    //= add to blacklist
    else {
      await exercise.setBlacklist();
    }
    return false;
  }

  Future<bool> _removeFromFavoriteOrBlacklist(
      DismissDirection direction) async {
    if (!isDismissible) await _removeExerciseTag();
    return isDismissible;
  }

  Future<void> _removeExerciseTag() async =>
      exercise.tag > 0 ? exercise.removeTag() : null;

  @override
  Widget build(BuildContext context) {
    final int tag = exercise.tag;

    return Dismissible(
        key: Key(exercise.key.toString()),
        direction: tag == 0
            ? DismissDirection.horizontal
            : DismissDirection.endToStart,
        background: const SwipableActionBackground.addToFavorites(),
        secondaryBackground: const <Widget>[
          SwipableActionBackground.addToBlacklist(),
          SwipableActionBackground.removeFromFavorites(),
          SwipableActionBackground.removeFromBlacklist(),
        ][tag],
        confirmDismiss: tag == 0
            ? _addToFavoriteOrBlacklist
            : _removeFromFavoriteOrBlacklist,
        onDismissed: isDismissible ? (_) => _removeExerciseTag() : (_) {},
        child: GestureDetector(
            onTap: () => Navigator.pushNamed(
                  context,
                  FluroRouter.getExerciseDetailsLink(
                    exerciseKey: exercise.key.toString(),
                  ),
                ),
            child: ExerciseItemBody(exercise)));
  }
}
