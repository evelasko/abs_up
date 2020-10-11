import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'constants/constants_data.dart';

Future<void> setInitialData(FirebaseFirestore firestore) async {
  final equipmentCollection = firestore.collection(CollectionNames.equipment);
  final exerciseCollection = firestore.collection(CollectionNames.exercise);

  final equipmentRemote = await equipmentCollection.get();
  final exerciseRemote = await exerciseCollection.get();
  if (equipmentRemote.size > 0 && exerciseRemote.size > 0) return;

  print('adding initial data');
  try {
    final Map<String, dynamic> localEquipment = jsonDecode(
      await rootBundle.loadString('assets/data/equipment.json', cache: false),
    ) as Map<String, dynamic>;
    for (final equipment in localEquipment.entries) {
      await equipmentCollection
          .doc(equipment.key)
          .set(equipment.value as Map<String, dynamic>);
    }

    final Map<String, dynamic> localExercise = jsonDecode(
      await rootBundle.loadString('assets/data/exercises.json', cache: false),
    ) as Map<String, dynamic>;
    for (final exercise in localExercise.entries) {
      await exerciseCollection.doc(exercise.key).set(
            (exercise.value as Map<String, dynamic>)
                .map((key, value) => MapEntry(
                      key,
                      key == 'equipment'
                          ? equipmentCollection.doc(value as String)
                          : value,
                    )),
          );
    }
  } catch (e) {
    print(e);
  }
}
