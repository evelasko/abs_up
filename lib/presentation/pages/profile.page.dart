import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:wiredash/wiredash.dart';

import '../../domain/state/auth_store.dart';
import '../theme/colors.t.dart';
import '../widgets/bottom_sheet_menu.w.dart';
import '../widgets/login_dialog.w.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authStore = Provider.of<AuthStore>(context);
    const List<Tab> userTabs = <Tab>[
      Tab(icon: Icon(FontAwesomeIcons.clipboardList)),
      Tab(icon: Icon(FontAwesomeIcons.stream)),
    ];
    return DefaultTabController(
      length: userTabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              expandedHeight: 280,
              flexibleSpace: Observer(
                builder: (_) => FlexibleSpaceBar(
                  stretchModes: const [
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle
                  ],
                  background: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: Center(
                      //= User Avatar
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.greyDark,
                        child: Text(
                          _authStore.displayName.foldRight(
                              'GU',
                              (result, _) =>
                                  result
                                      .splitMapJoin(RegExp('(?<=^| )[a-zA-Z]'),
                                          onMatch: (m) => m.group(0),
                                          onNonMatch: (n) => '')
                                      .substring(0, 2)
                                      .toUpperCase() ??
                                  'NA'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(bottom: 90),
                  //= User Name
                  title: Text(
                    _authStore.displayName
                        .foldRight<String>('Guest User', (result, _) => result),
                    style: const TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              //= Bottom Sheet Menu button
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => showModalBottomSheet<bool>(
                        context: context,
                        builder: (context) => const BottomSheetMenu(),
                        backgroundColor: Colors.transparent)
                    .then(
                        (value) => value ? Wiredash.of(context).show() : null),
              ),
              actions: [
                Observer(
                  builder: (_) => _authStore.user.fold(
                    //= Sign In Button
                    () => IconButton(
                      icon: const Icon(FontAwesomeIcons.signInAlt),
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const LoginDialog()),
                    ),
                    //= Sign Out Button
                    (r) => IconButton(
                      icon: const Icon(FontAwesomeIcons.signOutAlt),
                      onPressed: () => _authStore.logOutUser(),
                    ),
                  ),
                ),
              ],
              bottom: const TabBar(
                tabs: userTabs,
              ),
            ),
          )
        ],
        body: TabBarView(
          children: [
            //= User Logs
            UserContentTabView(
              delegate: _authStore.userLogs.fold(
                () => null,
                (logs) => SliverChildBuilderDelegate(
                  (BuildContext context, int index) => ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(logs[index].sourceWorkoutName ?? 'Random Workout'),
                        Text(logs[index].totalDurationString)
                      ],
                    ),
                    subtitle: Text(Moment.now().from(logs[index].performedAt)),
                  ),
                  childCount: logs.length,
                ),
              ),
            ),
            //= User stream
            UserContentTabView(
              delegate: _authStore.userActivity.fold(
                () => null,
                (activities) => SliverChildBuilderDelegate(
                  (BuildContext context, int index) => ListTile(
                    title: Text(activities[index]),
                  ),
                  childCount: activities.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserContentTabView extends StatelessWidget {
  final SliverChildBuilderDelegate delegate;
  final int childCount;
  final Widget emptyFeedback;
  final EdgeInsets padding;
  final double itemExtent;
  const UserContentTabView({
    Key key,
    @required this.delegate,
    this.emptyFeedback = const Center(child: Text('no content here...')),
    this.padding = const EdgeInsets.all(8),
    this.itemExtent = 60.0,
    this.childCount = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        bottom: false,
        child: Builder(
            builder: (BuildContext context) => CustomScrollView(
                  key: PageStorageKey<String>('userContentTab:$key'),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverPadding(
                      padding: padding,
                      sliver: SliverFixedExtentList(
                        itemExtent: itemExtent,
                        delegate: childCount > 0 && delegate != null
                            ? delegate
                            : SliverChildBuilderDelegate(
                                (BuildContext context, int index) =>
                                    emptyFeedback,
                                childCount: 1),
                      ),
                    )
                  ],
                )),
      );
}
