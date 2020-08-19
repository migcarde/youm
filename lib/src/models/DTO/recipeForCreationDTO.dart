import 'package:youm/src/models/DTO/IngredientForCreationDTO.dart';

class RecipeForCreationDTO {
  String title;
  String description;
  String picture;
  int quantity = 0;
  double calories = 0;
  double proteins = 0;
  double carbohydrate = 0;
  double fat = 0;
  String difficulty;
  double time = 0;
  List<IngredientForCreationDTO> ingredients = List<IngredientForCreationDTO>();
  List<String> tags = List<String>();

  RecipeForCreationDTO(
      this.title,
      this.description,
      this.ingredients,
      this.picture,
      this.quantity,
      this.calories,
      this.proteins,
      this.carbohydrate,
      this.fat,
      this.difficulty,
      this.time,
      this.tags);

  RecipeForCreationDTO.create();

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'picture': picture,
        'quantity': quantity,
        'calories': calories,
        'proteins': proteins,
        'carbohydrate': carbohydrate,
        'fat': fat,
        'difficulty': difficulty,
        'time': time,
        'ingredients': ingredients,
        'tags': tags
      };
}
