import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stacked/stacked.dart';

import '../../../app/locator.dart';
import '../../../services/auth/auth.i.dart';
import '../../widgets/custom_paginated_datatable.dart';
import '../utilities/exercise_datatable_source.dart';
import 'main.vm.dart';

class MainView extends StatelessWidget {
  const MainView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<MainViewModel>.reactive(
        builder: (context, model, widget) => Scaffold(
            appBar: NeumorphicAppBar(
              actions: [
                IconButton(
                  onPressed: () => model.initialWorkload(),
                  icon: const Icon(Icons.access_alarm_outlined),
                ),
              ],
            ),
            body: model.exercises.isEmpty
                ? const Center(child: Text('No exercises fetched so far...'))
                : CustomPaginatedTable(
                    actions: <IconButton>[
                      IconButton(
                        splashColor: Colors.transparent,
                        icon: const Icon(Icons.refresh),
                        onPressed: () => model.fetchData(),
                      ),
                    ],
                    onRowChanged: (index) => model.rowsPerPage = index,
                    rowsPerPage: model.rowsPerPage,
                    showActions: true,
                    source: ExerciseDataTableSource(
                      onRowSelect: (index) => print(index),
                      exerciseData: model.exercises,
                    ),
                    dataColumns: model.tableScaffold,
                    sortColumnIndex: model.sortColumnIndex,
                    sortColumnAsc: model.sortAscending,
                  )),
        viewModelBuilder: () => MainViewModel(
          getIt<AuthInterface>(),
        ),
      );
}
