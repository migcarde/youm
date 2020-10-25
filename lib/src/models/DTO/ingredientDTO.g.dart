// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredientDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientDTO _$IngredientDTOFromJson(Map<String, dynamic> json) {
  return IngredientDTO(
    id: json['id'] as String,
    name: json['name'] as String,
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$IngredientDTOToJson(IngredientDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
    };
