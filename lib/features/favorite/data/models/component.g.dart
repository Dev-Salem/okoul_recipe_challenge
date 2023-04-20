// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveComponentAdapter extends TypeAdapter<HiveComponent> {
  @override
  final int typeId = 3;

  @override
  HiveComponent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveComponent(
      ingredientDescription: fields[0] as String,
      step: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveComponent obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.ingredientDescription)
      ..writeByte(1)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveComponentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
