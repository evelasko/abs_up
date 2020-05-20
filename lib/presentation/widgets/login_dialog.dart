import 'package:abs_up/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../domain/state/auth_store.dart';
import 'shared/app_full_logo.dart';
import 'shared/buttons.dart';

InputDecoration authFormDecoration(
        {@required String labelText, @required IconData icon}) =>
    InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.white)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:
                const BorderSide(color: AppColors.coquelicot, width: 3)),
        errorStyle: const TextStyle(fontSize: 14, color: Colors.white),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.white54,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.white54,
        ),
        filled: true,
        fillColor: Colors.white38);

class LoginDialog extends StatefulWidget {
  const LoginDialog({Key key}) : super(key: key);

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  AuthStore _authStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore ??= Provider.of<AuthStore>(context);
    _authStore.initAuthForm();
  }

  @override
  Widget build(BuildContext context) {
    if (_authStore.authFormState == null) _authStore.initAuthForm();
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('assets/app_images/torso_1_hq-min.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Observer(
        builder: (context) => Scaffold(
            backgroundColor: Colors.black45,
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Container(
                height: 240,
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    AppButtons.primaryActionButton(
                        onTap: () => _authStore.logInWithEmailAndPassword(),
                        text: 'Login'),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed:
                                  _authStore.registerWithEmailAndPassword,
                              child: const Text(
                                'Register',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {},
                              elevation: 0,
                              child: const Text('Reset Password',
                                  style: TextStyle(fontSize: 18)),
                            )
                          ]),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircularIconButton(
                              onTap: _authStore.signInWithGooglePressed,
                              icon: FontAwesomeIcons.google),
                          CircularIconButton(
                              onTap: () {}, icon: FontAwesomeIcons.facebookF),
                          CircularIconButton(
                              onTap: () {}, icon: FontAwesomeIcons.apple)
                        ]),
                  ],
                )),
            body: CustomScrollView(
                // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                slivers: [
                  SliverAppBar(
                    leading: Container(),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),
                      )
                    ],
                    backgroundColor: Colors.transparent,
                    expandedHeight: 250,
                    pinned: true,
                    flexibleSpace: const FlexibleSpaceBar(title: AppFullLogo()),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate.fixed([
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Form(
                        autovalidate:
                            _authStore.authFormState.showErrorMessages,
                        child: Column(children: [
                          TextFormField(
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              onChanged: _authStore.emailChanged,
                              validator: (_) => _authStore
                                  .authFormState.emailAddress.value
                                  .fold(
                                      (f) => f.maybeMap(
                                          invalidEmail: (_) => 'Invalid Email',
                                          orElse: () => null),
                                      (r) => null),
                              autocorrect: false,
                              decoration: authFormDecoration(
                                  labelText: 'Email',
                                  icon: Icons.mail_outline)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            onChanged: _authStore.passwordChanged,
                            validator: (_) =>
                                _authStore.authFormState.password.value.fold(
                                    (f) => f.maybeMap(
                                        insecurePassword: (_) =>
                                            'Password too weak',
                                        orElse: () => null),
                                    (r) => null),
                            autocorrect: false,
                            obscureText: true,
                            decoration: authFormDecoration(
                                labelText: 'Password',
                                icon: Icons.lock_outline),
                          ),
                        ]),
                      ),
                    ),
                  ]))
                ])),
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final IconData icon;
  const CircularIconButton({
    Key key,
    @required this.onTap,
    this.size = 80,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(size * 2)),
            color: Colors.white38),
        child: GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: size,
              height: size,
              child: Center(
                  child: Icon(
                icon,
                color: Colors.white,
                size: size / 2 - 6,
              )),
            )));
  }
}
