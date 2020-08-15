import 'package:youm/src/models/DTO/IngredientDTO.dart';
import 'package:youm/src/models/DTO/tagDTO.dart';

class RecipeDTO {
  String id;
  String title;
  String description;
  int quantity;
  double calories;
  double proteins;
  double carbohydrate;
  double fat;
  double rating;
  String difficulty;
  double time;
  List<IngredientDTO> ingredients;
  List<TagDTO> tags;

  RecipeDTO(
      {this.id,
      this.title,
      this.description,
      this.quantity,
      this.calories,
      this.proteins,
      this.carbohydrate,
      this.fat,
      this.rating,
      this.difficulty,
      this.time,
      this.ingredients,
      this.tags});

  factory RecipeDTO.fromJson(Map<String, dynamic> json) {
    return RecipeDTO(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        quantity: json['quantity'],
        calories: json['calories'].toDouble(),
        proteins: json['proteins'].toDouble(),
        carbohydrate: json['carbohydrate'].toDouble(),
        fat: json['fat'].toDouble(),
        rating: json['rating'].toDouble(),
        difficulty: json['difficulty'],
        time: json['time'].toDouble(),
        ingredients: json['ingredients']
            .map<IngredientDTO>((model) => IngredientDTO.fromJson(model))
            .toList(),
        tags: json['tags']
            .map<TagDTO>((model) => TagDTO.fromJson(model))
            .toList());
  }
}
