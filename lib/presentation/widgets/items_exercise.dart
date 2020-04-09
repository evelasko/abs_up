import 'package:flutter/material.dart';

import '../../domain/models/exercise.dart';
import '../../domain/repositories/i_user_settings_facade.dart';
import '../theme/colors.dart';
import 'items_exercise_body.dart';
import 'swipable_actions.dart';
import 'snackbars.dart';

/// Exercise Item Widget Class
class ExerciseItem extends StatefulWidget {
  final Exercise exercise;
  final String exerciseId;

  const ExerciseItem(
      {Key key, @required this.exercise, @required this.exerciseId})
      : super(key: key);

  @override
  _ExerciseItemState createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  ExerciseTag exerciseTag = ExerciseTag.exercise;

  @override
  void initState() {
    setState(() {
      exerciseTag = IUserSettingsFacade.getExerciseTag(widget.exerciseId);
    });
    super.initState();
  }

  void _updateState() => setState(() {
        exerciseTag = IUserSettingsFacade.getExerciseTag(widget.exerciseId);
      });

  Future<bool> _addToFavoriteOrBlacklist(DismissDirection direction) async {
    if (direction == DismissDirection.startToEnd) {
      await IUserSettingsFacade.addFavorite(widget.exerciseId);
      _updateState();
      Scaffold.of(context).showSnackBar(AppSnackbars.favoriteAdded);
    } else {
      await IUserSettingsFacade.addBlacklist(widget.exerciseId);
      _updateState();
      Scaffold.of(context).showSnackBar(AppSnackbars.blacklistAdded);
    }
    _updateState();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isDismissable =
        widget.key.toString().contains(RegExp(r'favoritesList|blacklistList'));
    print(isDismissable);
    switch (exerciseTag) {

      /// Favorite Exercise Item
      case ExerciseTag.favorited:
        return Dismissible(
            key: Key(widget.exerciseId),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(AppColors.brandeis,
                Icons.favorite_border, 'remove from\nfavorites'),
            confirmDismiss: (direction) async {
              // if it's not in favorites or blacklist page
              // do the action without dissmising the item
              if (!isDismissable) {
                await IUserSettingsFacade.removeFavorite(widget.exerciseId);
                _updateState();
              }
              return isDismissable;
            },
            onDismissed: (direction) async {
              await IUserSettingsFacade.removeFavorite(widget.exerciseId);
            },
            child: exerciseItemBody(widget.exerciseId, widget.exercise));

      /// Blacklist Exercise Item
      case ExerciseTag.blacklisted:
        return Dismissible(
            key: Key(widget.exerciseId),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(
                AppColors.brandeis, Icons.thumb_up, 'remove from\nblacklist'),
            confirmDismiss: (direction) async {
              if (!isDismissable) {
                await IUserSettingsFacade.removeBlacklist(widget.exerciseId);
                _updateState();
              }
              return isDismissable;
            },
            onDismissed: (direction) async {
              await IUserSettingsFacade.removeBlacklist(widget.exerciseId);
            },
            child: exerciseItemBody(widget.exerciseId, widget.exercise));

      /// Exercise Item
      case ExerciseTag.exercise:
        return exerciseItem(
            key: widget.exerciseId,
            exercise: widget.exercise,
            confirmDismiss: _addToFavoriteOrBlacklist);

      default:
        return exerciseItem(
            key: widget.exerciseId,
            exercise: widget.exercise,
            confirmDismiss: _addToFavoriteOrBlacklist);
    }
  }
}

/// Renders an Exercise list item
Widget exerciseItem(
        {@required String key,
        @required Exercise exercise,
        @required Future<bool> Function(DismissDirection) confirmDismiss}) =>
    Dismissible(
        key: Key(key),
        background: SwipableActions.background(
            Colors.green, Icons.favorite, 'favorite'),
        secondaryBackground: SwipableActions.secondaryBackground(
            Colors.red, Icons.not_interested, 'add to\nblacklist'),
        confirmDismiss: confirmDismiss,
        child: exerciseItemBody(key, exercise));
