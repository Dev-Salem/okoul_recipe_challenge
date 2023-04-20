// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveSectionsAdapter extends TypeAdapter<HiveSections> {
  @override
  final int typeId = 2;

  @override
  HiveSections read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveSections(
      components: (fields[0] as List).cast<Component>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveSections obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.components);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveSectionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
