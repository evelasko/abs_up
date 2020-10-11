import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/auth/auth.i.dart';
import 'signin.vm.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SignInViewModel>.reactive(
        builder: (context, model, widget) => CupertinoPageScaffold(
          child: model.isBusy
              ? const Center(child: CupertinoActivityIndicator())
              : DefaultTextStyle(
                  style: const TextStyle(color: CupertinoColors.systemGrey4),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('いらっしゃいませ'),
                        const Text('ユーザーはいません'),
                        CupertinoButton(
                          onPressed: () => model.singIn(),
                          child: const Text('入る'),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        viewModelBuilder: () => SignInViewModel(getIt<AuthInterface>()),
      );
}
