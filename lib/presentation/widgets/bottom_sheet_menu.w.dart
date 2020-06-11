import 'package:abs_up/constants.dart';
import 'package:abs_up/presentation/router/routes.dart';
import 'package:abs_up/presentation/theme/colors.t.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSheetMenu extends StatelessWidget {
  const BottomSheetMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      decoration: const BoxDecoration(
          color: AppColors.greyDarkest,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      padding: const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 10),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 5,
            margin: const EdgeInsets.only(top: 8, bottom: 10),
            decoration: const BoxDecoration(
              color: AppColors.greyDark,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          BottomSheetRowItem(
            icon: FontAwesomeIcons.question,
            label: 'Help',
            onTap: () => Navigator.of(context).pushNamed(SUPPORT_LINK),
          ),
          BottomSheetRowItem(
            icon: Icons.rate_review,
            label: 'Feedback',
            onTap: () {}, // TODO add Wiredash here
          ),
          BottomSheetRowItem(
            icon: Icons.feedback,
            label: 'Report a Problem',
            onTap: () => Navigator.of(context).pushNamed(FEEDBACK_LINK),
          ),
          BottomSheetRowItem(
            icon: FontAwesomeIcons.shieldAlt,
            label: 'Privacy and Security',
            onTap: () => Navigator.of(context).pushNamed(
                FluroRouter.getWebViewLink(
                    title: 'Privacy and Security',
                    url: PRIVACY_POLICY_WWW_LINK)),
          ),
          BottomSheetRowItem(
            icon: FontAwesomeIcons.book,
            label: 'Terms of Use',
            onTap: () => Navigator.of(context).pushNamed(
                FluroRouter.getWebViewLink(
                    title: 'Terms of Use', url: PRIVACY_POLICY_WWW_LINK)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Text(
              'The Misfit Coach'.toUpperCase(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.grey,
                height: 1.7,
                letterSpacing: 0.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomSheetRowItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const BottomSheetRowItem({
    Key key,
    @required this.icon,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.greyDark))),
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            children: [
              Icon(
                icon,
                color: AppColors.greyLight,
              ),
              const SizedBox(
                width: 18,
              ),
              Text(label,
                  style: const TextStyle(
                      fontSize: 16, color: AppColors.greyLight)),
            ],
          ),
        ),
      );
}
