import 'package:youm/src/models/DTO/creation/ingredientForCreationDTO.dart';
import 'package:youm/src/models/DTO/creation/tagForCreationDTO.dart';

class RecipeDTO {
  String title;
  String description;
  int quantity;
  double calories;
  double proteins;
  double carbohydrate;
  double fat;
  double rating;
  String difficulty;
  String time;
  List<IngredientForCreationDTO> ingredients;
  List<TagForCreationDTO> tags;

  RecipeDTO(
      {this.title,
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

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'quantity': quantity,
        'calories': calories,
        'proteins': proteins,
        'carbohydrate': carbohydrate,
        'fat': fat,
        'rating': rating,
        'difficulty': difficulty,
        'time': time,
        'ingredients': ingredients,
        'tags': tags
      };
}
