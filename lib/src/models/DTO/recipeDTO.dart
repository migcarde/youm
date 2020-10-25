import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:youm/src/models/DTO/ingredientDTO.dart';
import 'package:youm/src/models/DTO/tagDTO.dart';
part 'recipeDTO.g.dart';

@JsonSerializable()
class RecipeDTO {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'picture')
  String picture;
  @JsonKey(name: 'quantity')
  int quantity;
  @JsonKey(name: 'calories')
  double calories;
  @JsonKey(name: 'proteins')
  double proteins;
  @JsonKey(name: 'carbohydrate')
  double carbohydrate;
  @JsonKey(name: 'fat')
  double fat;
  @JsonKey(name: 'rating ')
  double rating;
  @JsonKey(name: 'difficulty')
  String difficulty;
  @JsonKey(name: 'time')
  String time;
  @JsonKey(name: 'ingredients')
  List<IngredientDTO> ingredients;
  @JsonKey(name: 'tags')
  List<TagDTO> tags;

  RecipeDTO(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.picture,
      @required this.quantity,
      this.calories,
      this.proteins,
      this.carbohydrate,
      this.fat,
      this.rating,
      @required this.difficulty,
      @required this.time,
      @required this.ingredients,
      @required this.tags});

  factory RecipeDTO.fromJson(Map<String, dynamic> json) =>
      _$RecipeDTOFromJson(json);
}
