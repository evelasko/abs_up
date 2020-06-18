// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutLogAdapter extends TypeAdapter<WorkoutLog> {
  @override
  final typeId = 5;

  @override
  WorkoutLog read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutLog(
      name: fields[0] as String,
      items: (fields[1] as List)?.cast<WorkoutItem>(),
      sourceWorkoutName: fields[3] as String,
      sourceWorkoutId: fields[4] as String,
    )..performedAt = fields[2] as DateTime;
  }

  @override
  void write(BinaryWriter writer, WorkoutLog obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.items)
      ..writeByte(2)
      ..write(obj.performedAt)
      ..writeByte(3)
      ..write(obj.sourceWorkoutName)
      ..writeByte(4)
      ..write(obj.sourceWorkoutId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
