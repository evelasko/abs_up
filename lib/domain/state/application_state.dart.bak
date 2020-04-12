import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../core/base_enums.dart';
import '../models/exercise.dart';
import '../models/user_settings.dart';
import '../repositories/data_repository.dart';

part 'application_state.g.dart';

class ApplicationStore extends _ApplicationStore with _$ApplicationStore {
  ApplicationStore(DataRepository dataRepository) : super(dataRepository);
}

abstract class _ApplicationStore with Store {
  final DataRepository _dataRepository;

  _ApplicationStore(this._dataRepository) {
    print('initializing state');
    // final userSettingsBox = IHiveFacade().userSettingsBox;
    // userSettingsBox.
  }

  @observable
  List<Exercise> exerciseList;
  @computed
  List<Exercise> get filteredExerciseList {}
  @observable
  ObservableFuture<List<Exercise>> _exerciseListFuture;

  @observable
  UserSettings userSettings;

  @computed
  StoreState get state {
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
      final exercisesBox = Hive.box<Exercise>('exercises');
      await exercisesBox.clear();
      await exercisesBox.addAll(exerciseList.map<Exercise>((e) => e));
    } catch (e) {
      print(e);
    }
  }
}
