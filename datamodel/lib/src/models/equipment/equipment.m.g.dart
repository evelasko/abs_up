// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.m.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension EquipmentCopyWithExtension on Equipment {
  Equipment copyWith({
    String description,
    String id,
    String label,
    String owner,
  }) {
    return Equipment(
      description: description ?? this.description,
      id: id ?? this.id,
      label: label ?? this.label,
      owner: owner ?? this.owner,
    );
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) {
  return Equipment(
    id: json['id'] as String,
    description: json['description'] as String,
    label: json['label'] as String,
    owner: json['owner'] as String,
  );
}

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'description': instance.description,
      'owner': instance.owner,
    };
