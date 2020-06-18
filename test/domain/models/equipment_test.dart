import 'package:abs_up/constants.dart';
import 'package:abs_up/domain/models/equipment.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Equipment Model', () {
    test('should return a list of equipment instances', () {
      //= act
      final Map<String, Equipment> allEquipment = Equipment.allEquipment;
      //= assert
      expect(EQUIPMENT_DATA_KEYS.length, allEquipment.length);
      allEquipment.forEach((key, value) {
        expect(value.runtimeType.toString(), 'Equipment');
        expect(EQUIPMENT_TEXT.containsValue(value.text), true);
        expect(value.icon.runtimeType.toString(), 'IconData');
      });
    });
    test('should return an equipment from a valid key', () {
      //= act
      final Equipment anEquipment =
          Equipment.equipmentFromKey(EQUIPMENT_DATA_KEYS[0]);
      final Equipment invalidEquipment =
          Equipment.equipmentFromKey('not a valid key');
      final Equipment nullEquipment = Equipment.equipmentFromKey(null);
      //= assert
      expect(anEquipment.runtimeType.toString(), 'Equipment');
      expect(invalidEquipment, null);
      expect(nullEquipment, null);
    });
  });
}
