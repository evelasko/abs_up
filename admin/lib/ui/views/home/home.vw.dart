import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/auth/auth.i.dart';
import '../main/main.vw.dart';
import '../signin/signin.vw.dart';
import 'home.vm.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<HomeViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        builder: (context, model, child) => model.isBusy
            ? const Center(child: CircularProgressIndicator())
            : !model.authenticated
                ? const SignInView()
                : const MainView(),
        viewModelBuilder: () => HomeViewModel(
          getIt<AuthInterface>(),
        ),
      );
}
