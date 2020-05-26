import 'package:flutter/material.dart';

class AppSnackbars {
  static const SnackBar favoriteAdded =
      SnackBar(content: Text('Exercise added to favorites'));
  static const SnackBar favoriteRemoved =
      SnackBar(content: Text('Exercise removed from favorites'));
  static const SnackBar blacklistAdded =
      SnackBar(content: Text('Exercise added to blacklist'));
  static const SnackBar blacklistRemoved =
      SnackBar(content: Text('Exercise removed from blacklist'));
  static SnackBar savedWorkoutAs(String name) =>
      SnackBar(content: Text('Saved workout as: $name'));
  static SnackBar removedWorkoutItem(String name) => SnackBar(
        content: Text('Removed $name from workout'),
      );
}
