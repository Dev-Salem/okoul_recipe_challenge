// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instruction.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveInstructionAdapter extends TypeAdapter<HiveInstruction> {
  @override
  final int typeId = 1;

  @override
  HiveInstruction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveInstruction(
      instructionDescription: fields[0] as String,
      step: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveInstruction obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.instructionDescription)
      ..writeByte(1)
      ..write(obj.step);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveInstructionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
