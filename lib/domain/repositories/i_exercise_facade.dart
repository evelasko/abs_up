import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_setup/domain/repositories/i_hive_facade.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/exercise.dart';

class IExerciseFacade {
  final exercisesCollection = Firestore.instance.collection('exercises');

  /// Fetch exercises from local JSON
  /// If there is no exercise loaded into Hive,
  /// will fetch local json and
  Future<void> fetchLocalExercises() async {
    final Map<String, dynamic> localExercises = jsonDecode(await rootBundle
        .loadString("assets/data/exercises.json", cache: false));
    if (IHiveFacade.exercisesBox.isOpen && IHiveFacade.exercisesBox.isEmpty) {
      localExercises.forEach((key, value) async =>
          Exercise().hasExerciseKeys(value)
              ? await IHiveFacade.exercisesBox
                  .put(key, Exercise().exerciseFromMap(value))
              : null);
    }
  }

  Future updateExerciseList() async {}
}
