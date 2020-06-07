import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../domain/state/auth_store.dart';
import '../theme/colors.t.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthStore _authStore;

  final List<Tab> userTabs = const <Tab>[
    Tab(
      icon: Icon(FontAwesomeIcons.clipboardList),
    ),
    Tab(
      icon: Icon(FontAwesomeIcons.stream),
    ),
  ];

  @override
  Future<void> didChangeDependencies() async {
    _authStore ??= Provider.of<AuthStore>(context);
    await _authStore.getUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: userTabs.length,
        child: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                automaticallyImplyLeading: false,
                floating: true,
                // pinned: true,
                expandedHeight: 280,
                flexibleSpace: const FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle
                  ],
                  background: Padding(
                    padding: EdgeInsets.only(bottom: 100),
                    child: Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.greyDark,
                        child: Text(
                          'GU',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  titlePadding: EdgeInsets.only(bottom: 90),
                  title: Text(
                    'Guest User',
                    style: TextStyle(
                        color: AppColors.greyLight,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                leading: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer()),
                actions: [
                  IconButton(icon: const Icon(Icons.person), onPressed: () {})
                ],
                bottom: TabBar(
                  tabs: userTabs,
                ),
              ),
            )
          ],
          body: TabBarView(
            children: [
              //= User Logs
              UserContentTabView(
                childCount: 10,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => ListTile(
                          title: Text('User Log Item $index'),
                        ),
                    childCount: 5),
              ),
              //= User stream
              UserContentTabView(
                childCount: 10,
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => ListTile(
                          title: Text('User Stream Item $index'),
                        ),
                    childCount: 10),
              )
            ],
          ),
        ),
      );
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
                        delegate: delegate ??
                            SliverChildBuilderDelegate(
                                (BuildContext context, int index) =>
                                    emptyFeedback,
                                childCount: 1),
                      ),
                    )
                  ],
                )),
      );
}
