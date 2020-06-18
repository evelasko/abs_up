// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<Exercise> {
  @override
  final typeId = 1;

  @override
  Exercise read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Exercise(
      description: fields[10] as String,
      media: fields[11] as String,
      thumb: fields[12] as String,
      impact: fields[7] as bool,
      group: fields[8] as String,
      name: fields[0] as String,
      difficulty: fields[1] as int,
      intensity: fields[2] as int,
      target: fields[3] as String,
      equipment: fields[4] as String,
      weighted: fields[5] as bool,
      sided: fields[6] as bool,
      tag: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Exercise obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.difficulty)
      ..writeByte(2)
      ..write(obj.intensity)
      ..writeByte(3)
      ..write(obj.target)
      ..writeByte(4)
      ..write(obj.equipment)
      ..writeByte(5)
      ..write(obj.weighted)
      ..writeByte(6)
      ..write(obj.sided)
      ..writeByte(7)
      ..write(obj.impact)
      ..writeByte(8)
      ..write(obj.group)
      ..writeByte(9)
      ..write(obj.tag)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.media)
      ..writeByte(12)
      ..write(obj.thumb);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
