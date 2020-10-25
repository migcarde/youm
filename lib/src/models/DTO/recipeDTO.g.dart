// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipeDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDTO _$RecipeDTOFromJson(Map<String, dynamic> json) {
  return RecipeDTO(
    id: json['id'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    picture: json['picture'] as String,
    quantity: json['quantity'] as int,
    calories: (json['calories'] as num)?.toDouble(),
    proteins: (json['proteins'] as num)?.toDouble(),
    carbohydrate: (json['carbohydrate'] as num)?.toDouble(),
    fat: (json['fat'] as num)?.toDouble(),
    rating: (json['rating '] as num)?.toDouble(),
    difficulty: json['difficulty'] as String,
    time: json['time'] as String,
    ingredients: (json['ingredients'] as List)
        ?.map((e) => e == null
            ? null
            : IngredientDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['tags'] as List)
        ?.map((e) =>
            e == null ? null : TagDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RecipeDTOToJson(RecipeDTO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'picture': instance.picture,
      'quantity': instance.quantity,
      'calories': instance.calories,
      'proteins': instance.proteins,
      'carbohydrate': instance.carbohydrate,
      'fat': instance.fat,
      'rating ': instance.rating,
      'difficulty': instance.difficulty,
      'time': instance.time,
      'ingredients': instance.ingredients,
      'tags': instance.tags,
    };
