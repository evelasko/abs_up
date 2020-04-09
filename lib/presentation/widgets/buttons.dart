import 'package:data_setup/presentation/theme/colors.dart';
import 'package:data_setup/presentation/theme/text.dart';
import 'package:flutter/material.dart';

enum ButtonTypes { primary, secondary, other }

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

class AppButtons {
  static Widget accentButton() => Container(
        height: 50.0,
        child: RaisedButton(
          elevation: 0,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(30.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
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

  static Widget homePageButton({Function onTap, IconData icon, String text}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
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
          {@required Function onTap,
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
          padding: EdgeInsets.all(0),
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
              padding: EdgeInsets.all(10),
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
          {@required Function onTap,
          @required IconData icon,
          String text,
          ButtonTypes buttonType = ButtonTypes.primary}) =>
      Container(
        width: 68,
        height: 68,
        child: RaisedButton(
          elevation: 0,
          onPressed: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          padding: EdgeInsets.all(0),
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
                ),
                other: BoxDecoration(
                  color: AppColors.greyLightest,
                  borderRadius: BorderRadius.circular(6.0),
                )),
            child: Container(
              width: 68,
              height: 68,
              padding: EdgeInsets.all(5),
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
}
