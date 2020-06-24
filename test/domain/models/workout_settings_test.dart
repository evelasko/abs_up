import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/workout_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Workout Item Model', () {
    test('should initialize with default values if none given', () {
      //= act
      final settings = WorkoutSettings();
      //= assert
      expect(settings.length, LENGTH_DEFAULT);
      expect(settings.intensity, INTENSITY_DEFAULT);
      expect(settings.difficulty, DIFFICULTY_DEFAULT);
      expect(settings.impact, IMPACT_DEFAULT);
      expect(settings.equipment, [EQUIPMENT_DEFAULT]);
    });
    test('should return intensity, difficulty, length and impact strings', () {
      //= arrange
      final settings = WorkoutSettings();
      //= assert
      expect(settings.intensityString, isNotEmpty);
      expect(settings.difficultyString, isNotEmpty);
      expect(settings.lengthString, isNotEmpty);
      expect(settings.impactString, isNotEmpty);
    });
    test('should return the selected equipment as a list of equipment objects',
        () {
      //= arrange
      final settings = WorkoutSettings();
      //= act
      final selectedEquipment = settings.equipmentObjectList;
      //= assert
      expect(selectedEquipment.isNotEmpty, true);
      expect(
          selectedEquipment.elementAt(0).runtimeType.toString(), 'Equipment');
    });
    // test('should set intensity, difficulty, length and impact values',
    //     () async {
    //   //= arrange
    //   final settings = WorkoutSettings();
    //   final settingsImpactToggle = WorkoutSettings();
    //   //= act
    //   await settings.intensitySetAndSave(intensityToString(2));
    //   await settings.difficultySetAndSave(difficultyToString(2));
    //   await settings.lengthSetAndSave(lengthToString(2));
    //   await settings.impactSetOrToggleAndSave(null);

    //   // the following should not yield exceptions
    //   await settingsImpactToggle.intensitySetAndSave(null);
    //   await settingsImpactToggle.difficultySetAndSave(null);
    //   await settingsImpactToggle.lengthSetAndSave(null);

    //   //= assert
    //   expect(settings.intensity, 2);
    //   expect(settings.difficulty, 2);
    //   expect(settings.length, 2);
    //   expect(settings.impact, isNot(settingsImpactToggle.impact));
    // });
    // test('should add and remove equipments to the selected equipment list',
    //     () async {
    //   //= arrange
    //   final settings = WorkoutSettings();
    //   final equipment = Equipment(
    //     text: 'An Equipment',
    //     icon: Icons.info,
    //     key: EQUIPMENT_PARTNER_KEY,
    //   );
    //   //= act & assert
    //   expect(settings.equipment.length, 1);
    //   await settings.addEquipment(key: EQUIPMENT_PHYSIO_BALL_KEY);
    //   await settings.addEquipment(
    //     equipment: equipment,
    //   );
    //   expect(settings.equipment.length, 3);
    //   await settings.removeEquipment(key: EQUIPMENT_PHYSIO_BALL_KEY);
    //   await settings.removeEquipment(
    //     equipment: equipment,
    //   );
    //   expect(settings.equipment.length, 1);

    //   // the following should not yield exceptions
    //   String nullable;
    //   Equipment nullableEquipment;
    //   await settings.addEquipment(
    //     key: nullable,
    //   );
    //   await settings.addEquipment(equipment: nullableEquipment);
    //   await settings.removeEquipment(key: nullable);
    //   await settings.removeEquipment(equipment: nullableEquipment);
    // });
    test('compare a map with similar keys', () {
      //= arrange
      final settings = WorkoutSettings();

      final Map<String, dynamic> workoutSettingsMap = {
        INTENSITY_KEY: 0,
        DIFFICULTY_KEY: 0,
        LENGTH_KEY: 0,
        IMPACT_KEY: 0,
        EQUIPMENT_KEY: 0,
      };
      final Map<String, dynamic> notWorkoutSettingsMag = {
        INTENSITY_KEY: 0,
        DIFFICULTY_KEY: 0,
      };
      //= act
      final itIs = settings.hasWorkoutSettingsKeys(workoutSettingsMap);
      final itIsNot = settings.hasWorkoutSettingsKeys(notWorkoutSettingsMag);
      //= assert
      expect(itIs, true);
      expect(itIsNot, false);
    });
    test('should return a copy of itself with the given fields changed', () {
      // TODO test workoutSettings.copyWith()
    });
  });
}
