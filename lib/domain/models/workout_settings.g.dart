// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutSettingsAdapter extends TypeAdapter<WorkoutSettings> {
  @override
  final typeId = 2;

  @override
  WorkoutSettings read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutSettings(
      length: fields[0] as int,
      intensity: fields[1] as int,
      difficulty: fields[2] as int,
      impact: fields[3] as bool,
      equipment: (fields[4] as List)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutSettings obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.length)
      ..writeByte(1)
      ..write(obj.intensity)
      ..writeByte(2)
      ..write(obj.difficulty)
      ..writeByte(3)
      ..write(obj.impact)
      ..writeByte(4)
      ..write(obj.equipment);
  }
}
