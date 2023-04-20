// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_recipe.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveDetailedRecipeAdapter extends TypeAdapter<HiveDetailedRecipe> {
  @override
  final int typeId = 0;

  @override
  HiveDetailedRecipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveDetailedRecipe(
      id: fields[0] as int,
      imageURL: fields[1] as String,
      instructions: (fields[2] as List).cast<Instruction>(),
      name: fields[3] as String,
      rating: fields[4] as Rating,
      sections: (fields[5] as List).cast<Sections>(),
    );
  }

  @override
  void write(BinaryWriter writer, HiveDetailedRecipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageURL)
      ..writeByte(2)
      ..write(obj.instructions)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.sections);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveDetailedRecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
