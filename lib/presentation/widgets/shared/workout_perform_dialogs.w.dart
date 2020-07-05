import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../domain/state/perform_store.dart';
import '../../theme/colors.t.dart';
import 'buttons.w.dart';
import 'modal_dialog.w.dart';

class AbandonWorkoutDialog extends StatelessWidget {
  const AbandonWorkoutDialog({
    Key key,
    @required PerformStore performStore,
  })  : _performStore = performStore,
        super(key: key);

  final PerformStore _performStore;

  @override
  Widget build(BuildContext context) {
    return AbsAppModalDialog(
      title: 'EXIT\nWORKOUT',
      buttons: <Widget>[
        SecondaryActionButton(
            text: 'Yes! Take me out',
            onTap: () {
              _performStore.abandonWorkout();
              Navigator.of(context).pop(true);
            }),
        const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        PrimaryActionButton(
            text: 'No! Keep me in',
            onTap: () => Navigator.of(context).pop(false)),
      ],
    );
  }
}

class FinishWorkoutDialog extends StatelessWidget {
  const FinishWorkoutDialog({
    Key key,
    @required PerformStore performStore,
  })  : _performStore = performStore,
        super(key: key);

  final PerformStore _performStore;

  @override
  Widget build(BuildContext context) {
    return AbsAppModalDialog(
      title: 'WORKOUT\nFINISHED',
      decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
      buttons: <Widget>[
        SecondaryActionButton(
            text: 'Home',
            icon: Icons.home,
            onTap: () => _performStore.finishWorkout().then(
                (value) => Navigator.popAndPushNamed(context, HOME_LINK))),
        SecondaryActionButton(
            buttonType: ButtonTypes.secondary,
            text: 'Share progress',
            icon: Icons.share,
            onTap: () => _performStore.finishWorkout().then((value) {
                  // TODO (late) implement sharing progress when finishing workout
                  Navigator.popAndPushNamed(context, HOME_LINK);
                }))
      ],
    );
  }
}
