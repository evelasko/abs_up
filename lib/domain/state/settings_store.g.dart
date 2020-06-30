// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$workoutSettingsAtom = Atom(name: '_SettingsStore.workoutSettings');

  @override
  WorkoutSettings get workoutSettings {
    _$workoutSettingsAtom.reportRead();
    return super.workoutSettings;
  }

  @override
  set workoutSettings(WorkoutSettings value) {
    _$workoutSettingsAtom.reportWrite(value, super.workoutSettings, () {
      super.workoutSettings = value;
    });
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  bool checkEquipmentStatus(String equipmentKey) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.checkEquipmentStatus');
    try {
      return super.checkEquipmentStatus(equipmentKey);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workoutSettings: ${workoutSettings}
    ''';
  }
}
