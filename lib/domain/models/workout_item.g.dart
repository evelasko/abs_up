// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutItemAdapter extends TypeAdapter<WorkoutItem> {
  @override
  final typeId = 3;

  @override
  WorkoutItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutItem(
      exercise: fields[0] as Exercise,
      order: fields[1] as int,
      duration: fields[2] as int,
      side: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exercise)
      ..writeByte(1)
      ..write(obj.order)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.side);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
