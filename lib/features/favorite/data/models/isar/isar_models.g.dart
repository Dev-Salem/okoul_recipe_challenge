// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarDetailedRecipeCollection on Isar {
  IsarCollection<IsarDetailedRecipe> get isarDetailedRecipes =>
      this.collection();
}

const IsarDetailedRecipeSchema = CollectionSchema(
  name: r'IsarDetailedRecipe',
  id: 747852834355707800,
  properties: {
    r'imageURL': PropertySchema(
      id: 0,
      name: r'imageURL',
      type: IsarType.string,
    ),
    r'instructions': PropertySchema(
      id: 1,
      name: r'instructions',
      type: IsarType.objectList,
      target: r'IsarInstruction',
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 3,
      name: r'rating',
      type: IsarType.object,
      target: r'IsarRating',
    ),
    r'recipeId': PropertySchema(
      id: 4,
      name: r'recipeId',
      type: IsarType.long,
    ),
    r'sections': PropertySchema(
      id: 5,
      name: r'sections',
      type: IsarType.objectList,
      target: r'IsarSections',
    )
  },
  estimateSize: _isarDetailedRecipeEstimateSize,
  serialize: _isarDetailedRecipeSerialize,
  deserialize: _isarDetailedRecipeDeserialize,
  deserializeProp: _isarDetailedRecipeDeserializeProp,
  idName: r'id',
  indexes: {
    r'recipeId': IndexSchema(
      id: 7223263824597846537,
      name: r'recipeId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'recipeId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'IsarRating': IsarRatingSchema,
    r'IsarInstruction': IsarInstructionSchema,
    r'IsarSections': IsarSectionsSchema,
    r'IsarComponent': IsarComponentSchema
  },
  getId: _isarDetailedRecipeGetId,
  getLinks: _isarDetailedRecipeGetLinks,
  attach: _isarDetailedRecipeAttach,
  version: '3.1.0',
);

int _isarDetailedRecipeEstimateSize(
  IsarDetailedRecipe object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.imageURL;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.instructions;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarInstruction]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarInstructionSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rating;
    if (value != null) {
      bytesCount += 3 +
          IsarRatingSchema.estimateSize(
              value, allOffsets[IsarRating]!, allOffsets);
    }
  }
  {
    final list = object.sections;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarSections]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarSectionsSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarDetailedRecipeSerialize(
  IsarDetailedRecipe object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageURL);
  writer.writeObjectList<IsarInstruction>(
    offsets[1],
    allOffsets,
    IsarInstructionSchema.serialize,
    object.instructions,
  );
  writer.writeString(offsets[2], object.name);
  writer.writeObject<IsarRating>(
    offsets[3],
    allOffsets,
    IsarRatingSchema.serialize,
    object.rating,
  );
  writer.writeLong(offsets[4], object.recipeId);
  writer.writeObjectList<IsarSections>(
    offsets[5],
    allOffsets,
    IsarSectionsSchema.serialize,
    object.sections,
  );
}

IsarDetailedRecipe _isarDetailedRecipeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarDetailedRecipe(
    imageURL: reader.readStringOrNull(offsets[0]),
    instructions: reader.readObjectList<IsarInstruction>(
      offsets[1],
      IsarInstructionSchema.deserialize,
      allOffsets,
      IsarInstruction(),
    ),
    name: reader.readStringOrNull(offsets[2]),
    rating: reader.readObjectOrNull<IsarRating>(
      offsets[3],
      IsarRatingSchema.deserialize,
      allOffsets,
    ),
    recipeId: reader.readLongOrNull(offsets[4]),
    sections: reader.readObjectList<IsarSections>(
      offsets[5],
      IsarSectionsSchema.deserialize,
      allOffsets,
      IsarSections(),
    ),
  );
  object.id = id;
  return object;
}

P _isarDetailedRecipeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<IsarInstruction>(
        offset,
        IsarInstructionSchema.deserialize,
        allOffsets,
        IsarInstruction(),
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<IsarRating>(
        offset,
        IsarRatingSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<IsarSections>(
        offset,
        IsarSectionsSchema.deserialize,
        allOffsets,
        IsarSections(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarDetailedRecipeGetId(IsarDetailedRecipe object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarDetailedRecipeGetLinks(
    IsarDetailedRecipe object) {
  return [];
}

void _isarDetailedRecipeAttach(
    IsarCollection<dynamic> col, Id id, IsarDetailedRecipe object) {
  object.id = id;
}

extension IsarDetailedRecipeByIndex on IsarCollection<IsarDetailedRecipe> {
  Future<IsarDetailedRecipe?> getByRecipeId(int? recipeId) {
    return getByIndex(r'recipeId', [recipeId]);
  }

  IsarDetailedRecipe? getByRecipeIdSync(int? recipeId) {
    return getByIndexSync(r'recipeId', [recipeId]);
  }

  Future<bool> deleteByRecipeId(int? recipeId) {
    return deleteByIndex(r'recipeId', [recipeId]);
  }

  bool deleteByRecipeIdSync(int? recipeId) {
    return deleteByIndexSync(r'recipeId', [recipeId]);
  }

  Future<List<IsarDetailedRecipe?>> getAllByRecipeId(
      List<int?> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'recipeId', values);
  }

  List<IsarDetailedRecipe?> getAllByRecipeIdSync(List<int?> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'recipeId', values);
  }

  Future<int> deleteAllByRecipeId(List<int?> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'recipeId', values);
  }

  int deleteAllByRecipeIdSync(List<int?> recipeIdValues) {
    final values = recipeIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'recipeId', values);
  }

  Future<Id> putByRecipeId(IsarDetailedRecipe object) {
    return putByIndex(r'recipeId', object);
  }

  Id putByRecipeIdSync(IsarDetailedRecipe object, {bool saveLinks = true}) {
    return putByIndexSync(r'recipeId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRecipeId(List<IsarDetailedRecipe> objects) {
    return putAllByIndex(r'recipeId', objects);
  }

  List<Id> putAllByRecipeIdSync(List<IsarDetailedRecipe> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'recipeId', objects, saveLinks: saveLinks);
  }
}

extension IsarDetailedRecipeQueryWhereSort
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QWhere> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhere>
      anyRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'recipeId'),
      );
    });
  }
}

extension IsarDetailedRecipeQueryWhere
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QWhereClause> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recipeId',
        value: [null],
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recipeId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdEqualTo(int? recipeId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'recipeId',
        value: [recipeId],
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdNotEqualTo(int? recipeId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recipeId',
              lower: [],
              upper: [recipeId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recipeId',
              lower: [recipeId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recipeId',
              lower: [recipeId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'recipeId',
              lower: [],
              upper: [recipeId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdGreaterThan(
    int? recipeId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recipeId',
        lower: [recipeId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdLessThan(
    int? recipeId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recipeId',
        lower: [],
        upper: [recipeId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterWhereClause>
      recipeIdBetween(
    int? lowerRecipeId,
    int? upperRecipeId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'recipeId',
        lower: [lowerRecipeId],
        includeLower: includeLower,
        upper: [upperRecipeId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarDetailedRecipeQueryFilter
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QFilterCondition> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageURL',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageURL',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageURL',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageURL',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageURL',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      imageURLIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageURL',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'recipeId',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'recipeId',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recipeId',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      recipeIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recipeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sections',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sections',
      ));
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sections',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarDetailedRecipeQueryObject
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QFilterCondition> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      instructionsElement(FilterQuery<IsarInstruction> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'instructions');
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      rating(FilterQuery<IsarRating> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rating');
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterFilterCondition>
      sectionsElement(FilterQuery<IsarSections> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sections');
    });
  }
}

extension IsarDetailedRecipeQueryLinks
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QFilterCondition> {}

extension IsarDetailedRecipeQuerySortBy
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QSortBy> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByImageURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByImageURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.desc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      sortByRecipeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.desc);
    });
  }
}

extension IsarDetailedRecipeQuerySortThenBy
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QSortThenBy> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByImageURL() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByImageURLDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageURL', Sort.desc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.asc);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QAfterSortBy>
      thenByRecipeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recipeId', Sort.desc);
    });
  }
}

extension IsarDetailedRecipeQueryWhereDistinct
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QDistinct> {
  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QDistinct>
      distinctByImageURL({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageURL', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QDistinct>
      distinctByRecipeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recipeId');
    });
  }
}

extension IsarDetailedRecipeQueryProperty
    on QueryBuilder<IsarDetailedRecipe, IsarDetailedRecipe, QQueryProperty> {
  QueryBuilder<IsarDetailedRecipe, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarDetailedRecipe, String?, QQueryOperations>
      imageURLProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageURL');
    });
  }

  QueryBuilder<IsarDetailedRecipe, List<IsarInstruction>?, QQueryOperations>
      instructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructions');
    });
  }

  QueryBuilder<IsarDetailedRecipe, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<IsarDetailedRecipe, IsarRating?, QQueryOperations>
      ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<IsarDetailedRecipe, int?, QQueryOperations> recipeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recipeId');
    });
  }

  QueryBuilder<IsarDetailedRecipe, List<IsarSections>?, QQueryOperations>
      sectionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sections');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarInstructionSchema = Schema(
  name: r'IsarInstruction',
  id: 3964677117489155298,
  properties: {
    r'instructionDescription': PropertySchema(
      id: 0,
      name: r'instructionDescription',
      type: IsarType.string,
    ),
    r'step': PropertySchema(
      id: 1,
      name: r'step',
      type: IsarType.long,
    )
  },
  estimateSize: _isarInstructionEstimateSize,
  serialize: _isarInstructionSerialize,
  deserialize: _isarInstructionDeserialize,
  deserializeProp: _isarInstructionDeserializeProp,
);

int _isarInstructionEstimateSize(
  IsarInstruction object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.instructionDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarInstructionSerialize(
  IsarInstruction object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.instructionDescription);
  writer.writeLong(offsets[1], object.step);
}

IsarInstruction _isarInstructionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarInstruction(
    instructionDescription: reader.readStringOrNull(offsets[0]),
    step: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _isarInstructionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarInstructionQueryFilter
    on QueryBuilder<IsarInstruction, IsarInstruction, QFilterCondition> {
  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instructionDescription',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instructionDescription',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructionDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructionDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructionDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructionDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      instructionDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructionDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarInstruction, IsarInstruction, QAfterFilterCondition>
      stepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'step',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarInstructionQueryObject
    on QueryBuilder<IsarInstruction, IsarInstruction, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarRatingSchema = Schema(
  name: r'IsarRating',
  id: 365767289921400812,
  properties: {
    r'countNegative': PropertySchema(
      id: 0,
      name: r'countNegative',
      type: IsarType.long,
    ),
    r'countPositive': PropertySchema(
      id: 1,
      name: r'countPositive',
      type: IsarType.long,
    ),
    r'score': PropertySchema(
      id: 2,
      name: r'score',
      type: IsarType.double,
    )
  },
  estimateSize: _isarRatingEstimateSize,
  serialize: _isarRatingSerialize,
  deserialize: _isarRatingDeserialize,
  deserializeProp: _isarRatingDeserializeProp,
);

int _isarRatingEstimateSize(
  IsarRating object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarRatingSerialize(
  IsarRating object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.countNegative);
  writer.writeLong(offsets[1], object.countPositive);
  writer.writeDouble(offsets[2], object.score);
}

IsarRating _isarRatingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarRating(
    countNegative: reader.readLongOrNull(offsets[0]),
    countPositive: reader.readLongOrNull(offsets[1]),
    score: reader.readDoubleOrNull(offsets[2]),
  );
  return object;
}

P _isarRatingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarRatingQueryFilter
    on QueryBuilder<IsarRating, IsarRating, QFilterCondition> {
  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countNegative',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countNegative',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countNegative',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countNegative',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countNegative',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countNegativeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countNegative',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'countPositive',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'countPositive',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countPositive',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countPositive',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countPositive',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition>
      countPositiveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countPositive',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score',
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IsarRating, IsarRating, QAfterFilterCondition> scoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension IsarRatingQueryObject
    on QueryBuilder<IsarRating, IsarRating, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarComponentSchema = Schema(
  name: r'IsarComponent',
  id: 7621659559540506691,
  properties: {
    r'ingredientDescription': PropertySchema(
      id: 0,
      name: r'ingredientDescription',
      type: IsarType.string,
    ),
    r'step': PropertySchema(
      id: 1,
      name: r'step',
      type: IsarType.long,
    )
  },
  estimateSize: _isarComponentEstimateSize,
  serialize: _isarComponentSerialize,
  deserialize: _isarComponentDeserialize,
  deserializeProp: _isarComponentDeserializeProp,
);

int _isarComponentEstimateSize(
  IsarComponent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ingredientDescription;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _isarComponentSerialize(
  IsarComponent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ingredientDescription);
  writer.writeLong(offsets[1], object.step);
}

IsarComponent _isarComponentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarComponent(
    ingredientDescription: reader.readStringOrNull(offsets[0]),
    step: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _isarComponentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarComponentQueryFilter
    on QueryBuilder<IsarComponent, IsarComponent, QFilterCondition> {
  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ingredientDescription',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ingredientDescription',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ingredientDescription',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ingredientDescription',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ingredientDescription',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ingredientDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      ingredientDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ingredientDescription',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      stepIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      stepIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'step',
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition> stepEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      stepGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition>
      stepLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'step',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarComponent, IsarComponent, QAfterFilterCondition> stepBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'step',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarComponentQueryObject
    on QueryBuilder<IsarComponent, IsarComponent, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const IsarSectionsSchema = Schema(
  name: r'IsarSections',
  id: 8738406723750025064,
  properties: {
    r'components': PropertySchema(
      id: 0,
      name: r'components',
      type: IsarType.objectList,
      target: r'IsarComponent',
    )
  },
  estimateSize: _isarSectionsEstimateSize,
  serialize: _isarSectionsSerialize,
  deserialize: _isarSectionsDeserialize,
  deserializeProp: _isarSectionsDeserializeProp,
);

int _isarSectionsEstimateSize(
  IsarSections object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.components;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[IsarComponent]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              IsarComponentSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _isarSectionsSerialize(
  IsarSections object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<IsarComponent>(
    offsets[0],
    allOffsets,
    IsarComponentSchema.serialize,
    object.components,
  );
}

IsarSections _isarSectionsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSections(
    components: reader.readObjectList<IsarComponent>(
      offsets[0],
      IsarComponentSchema.deserialize,
      allOffsets,
      IsarComponent(),
    ),
  );
  return object;
}

P _isarSectionsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<IsarComponent>(
        offset,
        IsarComponentSchema.deserialize,
        allOffsets,
        IsarComponent(),
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IsarSectionsQueryFilter
    on QueryBuilder<IsarSections, IsarSections, QFilterCondition> {
  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'components',
      ));
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'components',
      ));
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'components',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension IsarSectionsQueryObject
    on QueryBuilder<IsarSections, IsarSections, QFilterCondition> {
  QueryBuilder<IsarSections, IsarSections, QAfterFilterCondition>
      componentsElement(FilterQuery<IsarComponent> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'components');
    });
  }
}
