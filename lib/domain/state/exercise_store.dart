import '../models/exercise.dart';
import 'package:mobx/mobx.dart';
import '../repositories/data_repository.dart';

part 'exercise_store.g.dart';

class ExerciseStore extends _ExerciseStore with _$ExerciseStore {
  ExerciseStore(DataRepository dataRepository) : super(dataRepository);
}

enum StoreState { initial, loading, loaded }

abstract class _ExerciseStore with Store {
  final DataRepository _dataRepository;

  _ExerciseStore(this._dataRepository);

  @observable
  List<Exercise> exerciseList;

  @observable
  ObservableFuture<List<Exercise>> _exerciseListFuture;

  @computed
  StoreState get state {
    print(_exerciseListFuture?.status);
    if (_exerciseListFuture == null ||
        _exerciseListFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _exerciseListFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @observable
  String errorMessage;

  @action
  Future getExerciseList() async {
    try {
      errorMessage = null;

      _exerciseListFuture =
          ObservableFuture(_dataRepository.fetchRemoteExercises());

      exerciseList = await _exerciseListFuture;
      print(_exerciseListFuture.status);
      print(exerciseList.length);
    } catch (e) {
      print(e);
    }
  }
}
