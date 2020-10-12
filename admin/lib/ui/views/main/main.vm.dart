import 'package:abs_up_datamodel/abs_up_datamodel.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth/auth.i.dart';

class MainViewModel extends ReactiveViewModel {
  final AuthInterface _authService;

  final collectionPaging = CollectionPaging<Exercise>(
    query: Exercise().collectionRef.orderBy('name', descending: true),
    limit: 1000,
    collectionReference: Exercise().collectionRef,
    decode: (snap, _) => Exercise(snapshot: snap),
  );

  MainViewModel(this._authService) : assert(_authService != null);

  var _exercises = <Exercise>[];
  List<Exercise> get exercises => _exercises;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
      ];

  bool get authenticated => _authService.authenticated;
  String get userId => _authService.userId;
  Iterable<Exercise> exerciseList;

  Future<void> initialWorkload() async {
    print(_exercises?.length);
    _exercises = await collectionPaging.load<Exercise>();
    notifyListeners();
  }

  Future<void> addItem() async {}

  // SORT COLUMN INDEX...
  int get sortColumnIndex => _sortColumnIndex;
  set sortColumnIndex(int sortColumnIndex) {
    _sortColumnIndex = sortColumnIndex;
    notifyListeners();
  }

  // SORT ASCENDING....
  bool get sortAscending => _sortAscending;
  set sortAscending(bool sortAscending) {
    _sortAscending = sortAscending;
    notifyListeners();
  }

  int get rowsPerPage => _rowsPerPage;
  set rowsPerPage(int rowsPerPage) {
    _rowsPerPage = rowsPerPage;
    notifyListeners();
  }

  List<DataColumn> get tableScaffold => const <DataColumn>[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Difficulty')),
        DataColumn(label: Text('Intensity')),
        DataColumn(label: Text('Target')),
      ];

  // -------------------------------------- INTERNALS --------------------------------------------

  int _sortColumnIndex;
  bool _sortAscending = true;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  Future<void> fetchData() async {
    _exercises = await collectionPaging.load<Exercise>();
    // data.docs
    //     .map((snapshot) => snapshot.data())
    //     .map((json) => Exercise.fromJson(json))
    //     .toList();
    notifyListeners();
  }
}
