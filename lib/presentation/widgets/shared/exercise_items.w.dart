import 'package:abs_up/domain/state/exercises_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/models/exercise.dart';
import '../../router/routes.dart';
import '../../theme/colors.t.dart';
import 'exercise_items_body.w.dart';
import 'snackbars.w.dart';
import 'swipable_actions.w.dart';

/// Exercise Item Widget Class
class ExerciseItem extends StatefulWidget {
  final Exercise exercise;

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
    return false;
  }

  /// Remove exercise tag (either from favorites or blacklist)
  /// and show provided snackbar
  Future<void> removeExerciseTag() async {
    if (widget.exercise.tag > 0) {
      await widget.exercise.removeTag();
      // TODO dissmising the exercise item from a filtered list won't show resize animation  and confirmation snackbar (context is null while running this Future...)
      if (context != null) {
        Scaffold.of(context).removeCurrentSnackBar();
        Scaffold.of(context).showSnackBar(widget.exercise.tag == 1
            ? AppSnackbars.favoriteRemoved
            : AppSnackbars.blacklistRemoved);
      }
    }
  }

  /// Default callback for tapping the exercise item
  /// navigates to item's details
  void navigateToDetails() => Navigator.pushNamed(
        context,
        FluroRouter.getExerciseDetailsLink(
          exerciseKey: widget.exercise.key.toString(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    // if the item is shown in the favorites or blacklist pages
    // then the dissmisible must dissmiss the items, if it is shown
    // in the exercises list, then the dissmissible performs the action
    // without dissmising the item from the list

    final ExercisesStore _exercisesStore = Provider.of<ExercisesStore>(context);

    final isDismissable =
        _exercisesStore.filterBlacklisted || _exercisesStore.filterFavorites;
    switch (widget.exercise.tag) {

      /// Favorite Exercise Item
      case 1:
        return Dismissible(
            key: Key(widget.exercise.key.toString()),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(AppColors.brandeis,
                Icons.favorite_border, 'remove from\nfavorites'),
            confirmDismiss: (direction) async {
              // if the exercise list is not being filtered by favorites or blacklist
              // do the action without dissmising the item
              if (!isDismissable) await removeExerciseTag();
              return isDismissable;
            },
            onDismissed: (direction) async => removeExerciseTag(),
            child: GestureDetector(
                onTap: navigateToDetails,
                child: ExerciseItemBody(widget.exercise)));

      /// Blacklist Exercise Item
      case 2:
        return Dismissible(
            key: Key(widget.exercise.key.toString()),
            direction: DismissDirection.endToStart,
            background: SwipableActions.secondaryBackground(
                AppColors.brandeis, Icons.thumb_up, 'remove from\nblacklist'),
            confirmDismiss: (direction) async {
              // if the exercise list is not being filtered by favorites or blacklist
              // do the action without dissmising the item
              if (!isDismissable) await removeExerciseTag();
              return isDismissable;
            },
            onDismissed: (direction) async => removeExerciseTag(),
            child: GestureDetector(
                onTap: navigateToDetails,
                child: ExerciseItemBody(widget.exercise)));

      /// Exercise Item
      default:
        return Dismissible(
            key: Key(widget.exercise.key.toString()),
            background: SwipableActions.background(
                Colors.green, Icons.favorite, 'favorite'),
            secondaryBackground: SwipableActions.secondaryBackground(
                Colors.red, Icons.not_interested, 'add to\nblacklist'),
            confirmDismiss: _addToFavoriteOrBlacklist,
            child: GestureDetector(
                onTap: navigateToDetails,
                child: ExerciseItemBody(widget.exercise)));
    }
  }
}
