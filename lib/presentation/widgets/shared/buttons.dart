import 'package:abs_up/presentation/theme/colors.dart';
import 'package:abs_up/presentation/theme/text.dart';
import 'package:flutter/material.dart';

enum ButtonTypes { primary, secondary, other }
enum ButtonSide { left, center, right }

T buttonTypeCase<T>(
    {@required ButtonTypes type,
    @required T primary,
    @required T secondary,
    T other}) {
  switch (type) {
    case ButtonTypes.primary:
      return primary;
    case ButtonTypes.secondary:
      return secondary;
    case ButtonTypes.other:
      return other;
    default:
      return primary;
  }
}

T buttonSideCase<T>(
    {@required ButtonSide side,
    @required T left,
    @required T right,
    @required T center}) {
  switch (side) {
    case ButtonSide.left:
      return left;
    case ButtonSide.right:
      return right;
    case ButtonSide.center:
      return center;
    default:
      return center;
  }
}

class AppButtons {
  /// Main Accent Button
  static Widget accentButton() => Container(
        height: 50.0,
        child: RaisedButton(
          elevation: 0,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints:
                  const BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );

  /// Home Page Menu Buttons
  static BoxDecoration homePageButtonDecoration =
      BoxDecoration(border: Border.all(width: 1, color: AppColors.greyDark));

  static Widget homePageButton(
          {@required VoidCallback onTap,
          @required IconData icon,
          @required String text,
          ButtonSide buttonSide}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          decoration: buttonSideCase<BoxDecoration>(
              side: buttonSide,
              left: homePageButtonDecoration.copyWith(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              right: homePageButtonDecoration.copyWith(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              center: homePageButtonDecoration),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                icon,
                color: AppColors.greyLight,
                size: 45,
              ),
              Text(text.toUpperCase(), style: AppTextStyles.homeButtonText)
            ],
          ),
        ),
      );

  static Widget boxedBigIconButton(
          {@required VoidCallback onTap,
          @required IconData icon,
          String text,
          ButtonTypes buttonType = ButtonTypes.primary}) =>
      Container(
        width: 100,
        height: 100,
        child: RaisedButton(
          color: Colors.transparent,
          elevation: 0,
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          padding: const EdgeInsets.all(0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: buttonTypeCase<Gradient>(
                  type: buttonType,
                  primary: AppColors.primaryGradient,
                  secondary: AppColors.secondaryGradient,
                  other: AppColors.primaryGradient,
                ),
                borderRadius: BorderRadius.circular(6.0)),
            child: Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(
                    icon,
                    size: text != null ? 36 : 64,
                    color: Colors.white,
                  ),
                  text != null
                      ? Text(text.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600))
                      : Container(
                          width: 0,
                          height: 0,
                        )
                ],
              ),
            ),
          ),
        ),
      );

  static Widget boxedSmallIconButton(
          {@required VoidCallback onTap,
          @required IconData icon,
          String text,
          ButtonTypes buttonType = ButtonTypes.primary}) =>
      Container(
        width: 68,
        height: 68,
        child: RaisedButton(
          color: Colors.transparent,
          elevation: 0,
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          padding: const EdgeInsets.all(0),
          child: Ink(
            decoration: buttonTypeCase<BoxDecoration>(
                type: buttonType,
                primary: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(6.0),
                ),
                secondary: BoxDecoration(
                    border: Border.all(color: AppColors.rudy, width: 2),
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.transparent),
                other: BoxDecoration(
                  color: AppColors.greyLight,
                  borderRadius: BorderRadius.circular(6.0),
                )),
            child: Container(
              width: 68,
              height: 68,
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: text != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: text != null ? 26 : 33,
                    color: buttonTypeCase<Color>(
                        type: buttonType,
                        primary: Colors.white,
                        secondary: AppColors.rudy,
                        other: AppColors.greyDark),
                  ),
                  text != null
                      ? Text(text.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: buttonTypeCase<Color>(
                                  type: buttonType,
                                  primary: Colors.white,
                                  secondary: AppColors.rudy,
                                  other: AppColors.greyDark),
                              fontSize: 10,
                              fontWeight: FontWeight.w600))
                      : Container(
                          width: 0,
                          height: 0,
                        )
                ],
              ),
            ),
          ),
        ),
      );

  static Widget primaryActionButton(
          {@required VoidCallback onTap,
          @required String text,
          IconData icon,
          ButtonTypes buttonType = ButtonTypes.primary}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 48,
            child: Container(
              decoration: BoxDecoration(
                  gradient: buttonTypeCase<Gradient>(
                    type: buttonType,
                    primary: AppColors.primaryGradient,
                    secondary: AppColors.secondaryGradient,
                    other: AppColors.primaryGradient,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    icon != null
                        ? Icon(
                            icon,
                            size: 24,
                            color: Colors.white,
                          )
                        : Container(),
                    icon != null
                        ? const Padding(padding: EdgeInsets.only(right: 5))
                        : Container(),
                    Text(text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w800)),
                  ]),
            ),
          ),
        ),
      );

  static Widget secondaryActionButton(
          {@required VoidCallback onTap,
          @required String text,
          IconData icon,
          ButtonTypes buttonType = ButtonTypes.primary}) =>
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 48,
            child: Container(
              decoration: BoxDecoration(
                  border: buttonType == ButtonTypes.secondary
                      ? Border.all(color: Colors.white, width: 2)
                      : null,
                  color: buttonTypeCase<Color>(
                    type: buttonType,
                    primary: Colors.white,
                    secondary: Colors.transparent,
                    other: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    icon != null
                        ? Icon(icon,
                            size: 24,
                            color: buttonType != ButtonTypes.secondary
                                ? AppColors.coquelicot
                                : Colors.white)
                        : Container(),
                    icon != null
                        ? const Padding(padding: EdgeInsets.only(right: 15))
                        : Container(),
                    Text(text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            color: buttonType != ButtonTypes.secondary
                                ? AppColors.coquelicot
                                : Colors.white,
                            fontWeight: FontWeight.w800)),
                  ]),
            ),
          ),
        ),
      );
}
