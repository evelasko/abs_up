import 'package:abs_up/presentation/widgets/shared/buttons.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/icons.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      backgroundColor: const Color.fromARGB(200, 32, 33, 37),
      child: Center(
        child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
                color: AppColors.greyLightest,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListView(
              children: [
                TextField(),
                TextField(),
                AppButtons.primaryActionButton(onTap: () {}, text: 'Login'),
                AppButtons.primaryActionButton(
                    onTap: () {},
                    text: 'Register',
                    buttonType: ButtonTypes.secondary),
                MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  child: const Text('Forgot Password'),
                ),
                AppButtons.secondaryActionButton(
                    onTap: () {}, text: 'Login with Google', icon: Icons.work),
                AppButtons.secondaryActionButton(
                    onTap: () {}, text: 'Login with Facebook', icon: Icons.face)
              ],
            )),
      ),
    );
  }
}
