// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.m.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum EquipmentKey {
  id,
  label,
  description,
  owner,
}

extension EquipmentKeyExtension on EquipmentKey {
  String get value {
    switch (this) {
      case EquipmentKey.id:
        return 'id';
      case EquipmentKey.label:
        return 'label';
      case EquipmentKey.description:
        return 'description';
      case EquipmentKey.owner:
        return 'owner';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Equipment doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'id', doc.id);
  Helper.writeNotNull(data, 'label', doc.label);
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'owner', doc.owner);

  return data;
}

/// For load data
void _$fromData(Equipment doc, Map<String, dynamic> data) {
  doc.id = Helper.valueFromKey<String>(data, 'id');
  doc.label = Helper.valueFromKey<String>(data, 'label');
  doc.description = Helper.valueFromKey<String>(data, 'description');
  doc.owner = Helper.valueFromKey<String>(data, 'owner');
}
