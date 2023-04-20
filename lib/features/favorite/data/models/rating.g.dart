// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveRatingAdapter extends TypeAdapter<HiveRating> {
  @override
  final int typeId = 4;

  @override
  HiveRating read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveRating(
      countNegative: fields[0] as int,
      countPositive: fields[1] as int,
      score: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveRating obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.countNegative)
      ..writeByte(1)
      ..write(obj.countPositive)
      ..writeByte(2)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveRatingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
