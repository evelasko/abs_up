//: Main functions to handle application data
import 'dart:convert';
import '../core/extensions.dart';

import '../models/exercise.dart';
import 'package:http/http.dart' as http;

abstract class DataRepository {
  Future<List<Exercise>> fetchRemoteExercises();
}

class ExerciseDataRepository implements DataRepository {
  Future<List<Exercise>> fetchRemoteExercises() async {
    List<Exercise> loadedExercises = [];
    try {
      final response = await http.get('http://localhost:3000/exercises');
      final extractedData = jsonDecode(response.body) as List<dynamic>;
      if (extractedData == null) {
        throw Error();
      }
      loadedExercises = extractedData
          .map((exercise) => Exercise(
                name: exercise['name'],
                difficulty: int.parse(exercise['difficulty']),
                intensity: int.parse(exercise['intensity']),
                target: exercise['target'],
                equipment: exercise['equipment'],
                weighted: exercise['weighted'].toString().toBool(),
                sided: exercise['sided'].toString().toBool(),
              ))
          .toList();
    } catch (e) {
      print(e);
    }
    print('loaded ${loadedExercises.length}');
    print('the first one named: ${loadedExercises[0].name}');
    return loadedExercises;
  }
}
