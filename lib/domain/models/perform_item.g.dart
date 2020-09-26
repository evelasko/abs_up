// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perform_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerformItemAdapter extends TypeAdapter<PerformItem> {
  @override
  final typeId = 5;

  @override
  PerformItem read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PerformItem(
      exercise: fields[0] as Exercise,
      order: fields[1] as int,
      duration: fields[2] as int,
      side: fields[3] as int,
      weight: fields[4] as double,
      progress: fields[5] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PerformItem obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.exercise)
      ..writeByte(1)
      ..write(obj.order)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.side)
      ..writeByte(4)
      ..write(obj.weight)
      ..writeByte(5)
      ..write(obj.progress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerformItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
