import 'package:flutter/material.dart';

import '../../../domain/models/exercise.dart';
import '../../theme/colors.dart';
import 'exercise_items_body.dart';
import 'snackbars.dart';
import 'swipable_actions.dart';

/// Exercise Item Widget Class
class ExerciseItem extends StatefulWidget {
  final Exercise exercise;
  // final String exerciseId;

  const ExerciseItem({Key key, @required this.exercise}) : super(key: key);

  @override
  _ExerciseItemState createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  /// Action for non dissmisible list items:
  /// these actions will be performed by the Dissmissible
  /// but the items won't be dissmised from the list
  Future<bool> _addToFavoriteOrBlacklist(DismissDirection direction) async {
    Scaffold.of(context).removeCurrentSnackBar();

    //= add to favorites
    if (direction == DismissDirection.startToEnd) {
      await widget.exercise.setFavorite();
      Scaffold.of(context).showSnackBar(AppSnackbars.favoriteAdded);
    }

    //= add to blacklist
    else {
      await widget.exercise.setBlacklist();
      Scaffold.of(context).showSnackBar(AppSnackbars.blacklistAdded);
    }
    // confirmDissmiss requires to return bool
    // this bool must be false in order to
    return false;
  }

  /// Remove exercise tag (either from favorites or blacklist)
  /// and show provided snackbar
  Future<void> removeExerciseTag() async {
    if (widget.exercise.tag > 0) {
      await widget.exercise.removeTag();
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(widget.exercise.tag == 1
          ? AppSnackbars.favoriteRemoved
          : AppSnackbars.blacklistRemoved);
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
          child: exerciseItemBody(context, exercise));

  @override
  Widget build(BuildContext context) {
    // if the item is shown in the favorites or blacklist pages
    // then the dissmisible must dissmiss the items, if it is shown
    // in the exercises list, then the dissmissible performs the action
    // without dissmising the item from the list
    final isDismissable =
        widget.key.toString().contains(RegExp(r'favoritesList|blacklistList'));
    switch (widget.exercise.tag) {

      /// Favorite Exercise Item
      case 1:
        return Dismissible(
            key: Key(widget.exercise.key),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(AppColors.brandeis,
                Icons.favorite_border, 'remove from\nfavorites'),
            confirmDismiss: (direction) async {
              // if it's not in favorites or blacklist page
              // do the action without dissmising the item
              if (!isDismissable) await removeExerciseTag();
              return isDismissable;
            },
            onDismissed: (direction) async => await removeExerciseTag(),
            child: exerciseItemBody(context, widget.exercise));

      /// Blacklist Exercise Item
      case 2:
        return Dismissible(
            key: Key(widget.exercise.key),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(
                AppColors.brandeis, Icons.thumb_up, 'remove from\nblacklist'),
            confirmDismiss: (direction) async {
              if (!isDismissable) await removeExerciseTag();
              return isDismissable;
            },
            onDismissed: (direction) async => await removeExerciseTag(),
            child: exerciseItemBody(context, widget.exercise));

      /// Exercise Item
      default:
        return exerciseItem(
            key: widget.exercise.key,
            exercise: widget.exercise,
            confirmDismiss: _addToFavoriteOrBlacklist);
    }
  }
}
