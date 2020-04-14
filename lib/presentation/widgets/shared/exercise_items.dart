import 'package:flutter/material.dart';

import '../../../domain/models/exercise.dart';
import '../../../domain/repositories/i_user_settings_facade.dart';
import '../../theme/colors.dart';
import 'exercise_items_body.dart';
import 'swipable_actions.dart';
import 'snackbars.dart';

/// Exercise Item Widget Class
class ExerciseItem extends StatefulWidget {
  final Exercise exercise;
  // final String exerciseId;

  const ExerciseItem({Key key, @required this.exercise}) : super(key: key);

  @override
  _ExerciseItemState createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  ExerciseTag exerciseTag = ExerciseTag.exercise;

  @override
  void initState() {
    setState(() {
      exerciseTag = IUserSettingsFacade.getExerciseTag(widget.exercise.key);
    });
    super.initState();
  }

  void _updateState() => setState(() {
        exerciseTag = IUserSettingsFacade.getExerciseTag(widget.exercise.key);
      });

  Future<bool> _addToFavoriteOrBlacklist(DismissDirection direction) async {
    //= add to favorites
    if (direction == DismissDirection.startToEnd) {
      await IUserSettingsFacade.addFavorite(widget.exercise.key);
      _updateState();
      Scaffold.of(context).showSnackBar(AppSnackbars.favoriteAdded);
    }
    //= add to blacklist
    else {
      await IUserSettingsFacade.addBlacklist(widget.exercise.key);
      _updateState();
      Scaffold.of(context).showSnackBar(AppSnackbars.blacklistAdded);
    }
    _updateState();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // if the item is shown in the favorites or blacklist pages
    // then the dissmisible must dissmiss the items, if it is shown
    // in the exercises list, then the dissmissible performs the action
    // without dissmising the item from the list
    final isDismissable =
        widget.key.toString().contains(RegExp(r'favoritesList|blacklistList'));
    switch (exerciseTag) {

      /// Favorite Exercise Item
      case ExerciseTag.favorited:
        return Dismissible(
            key: Key(widget.exercise.key),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(AppColors.brandeis,
                Icons.favorite_border, 'remove from\nfavorites'),
            confirmDismiss: (direction) async {
              // if it's not in favorites or blacklist page
              // do the action without dissmising the item
              if (!isDismissable) {
                await IUserSettingsFacade.removeFavorite(widget.exercise.key);
                _updateState();
              }
              return isDismissable;
            },
            onDismissed: (direction) async {
              await IUserSettingsFacade.removeFavorite(widget.exercise.key);
            },
            child: exerciseItemBody(widget.exercise));

      /// Blacklist Exercise Item
      case ExerciseTag.blacklisted:
        return Dismissible(
            key: Key(widget.exercise.key),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(
                AppColors.brandeis, Icons.thumb_up, 'remove from\nblacklist'),
            confirmDismiss: (direction) async {
              if (!isDismissable) {
                await IUserSettingsFacade.removeBlacklist(widget.exercise.key);
                _updateState();
              }
              return isDismissable;
            },
            onDismissed: (direction) async {
              await IUserSettingsFacade.removeBlacklist(widget.exercise.key);
            },
            child: exerciseItemBody(widget.exercise));

      /// Exercise Item
      case ExerciseTag.exercise:
        return exerciseItem(
            key: widget.exercise.key,
            exercise: widget.exercise,
            confirmDismiss: _addToFavoriteOrBlacklist);

      default:
        return exerciseItem(
            key: widget.exercise.key,
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
        child: exerciseItemBody(exercise));
