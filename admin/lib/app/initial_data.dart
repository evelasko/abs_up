import 'dart:convert';

import 'package:abs_up_datamodel/abs_up_datamodel.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flutter/services.dart';

Future<void> setInitialData(Flamingo firestore) async {
  // final equipmentCollection = firestore.collection(CollectionNames.equipment);
  // final exerciseCollection = firestore.collection(CollectionNames.exercise);

  // final equipmentRemote = await equipmentCollection.get();
  // final exerciseRemote = await exerciseCollection.get();
  // if (equipmentRemote.size > 0 && exerciseRemote.size > 0) return;

  // print(firestore.firestore.settings.host);

  print('adding initial data');
  try {
    final batch = Batch();

    final Map<String, dynamic> localEquipment = jsonDecode(
      await rootBundle.loadString('assets/data/equipment.json', cache: false),
    ) as Map<String, dynamic>;

    for (final equipment in localEquipment.entries) {
      batch.save(
        Equipment(
          id: equipment.key,
          values: equipment.value as Map<String, dynamic>,
        ),
      );
      // await equipmentCollection
      //     .doc(equipment.key)
      //     .set(equipment.value as Map<String, dynamic>);
    }

    final Map<String, dynamic> localExercise = jsonDecode(
      await rootBundle.loadString('assets/data/exercises.json', cache: false),
    ) as Map<String, dynamic>;
    for (final exercise in localExercise.entries) {
      batch.save(
        Exercise(
          id: exercise.key,
          values: exercise.value as Map<String, dynamic>,
        ),
      );
      // await exerciseCollection.doc(exercise.key).set(
      //       (exercise.value as Map<String, dynamic>)
      //           .map((key, value) => MapEntry(
      //                 key,
      //                 key == 'equipment'
      //                     ? equipmentCollection.doc(value as String)
      //                     : value,
      //               )),
      //     );
    }
    await batch.commit();
  } catch (e) {
    print(e);
  }
}
