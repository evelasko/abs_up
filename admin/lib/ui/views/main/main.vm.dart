import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:stacked/stacked.dart';

import '../../../services/auth/auth.i.dart';

class MainViewModel extends ReactiveViewModel {
  final AuthInterface _authService;
  final FirebaseFirestore _firestore;

  MainViewModel(
    this._authService,
    this._firestore,
  )   : assert(_authService != null),
        assert(_firestore != null);

  @override
  List<ReactiveServiceMixin> get reactiveServices => [
        _authService as ReactiveServiceMixin,
      ];

  bool get authenticated => _authService.authenticated;
  String get userId => _authService.userId;

  final String exerciseCollection = 'exercise';
  Iterable<Exercise> exerciseList;

  Future<void> addItem() async =>
      _firestore.collection(exerciseCollection).add({});

  Future<void> initialWorkload() async {
    final data = await _firestore.collection(CollectionNames.exercise).get();
    exerciseList = data.docs
        .map((snapshot) => snapshot.data())
        .map((json) => Exercise.fromJson(json));
    print(exerciseList.length);
    // print(exerciseList.join('\n'));
    _exercises = exerciseList.toList();
    notifyListeners();
  }

  List<Exercise> get exercises => _exercises;

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

  var _exercises = <Exercise>[];

  int _sortColumnIndex;
  bool _sortAscending = true;
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  Future<void> fetchData() async {
    final data = await _firestore.collection(CollectionNames.exercise).get();
    _exercises = data.docs
        .map((snapshot) => snapshot.data())
        .map((json) => Exercise.fromJson(json))
        .toList();
    notifyListeners();
  }
}
