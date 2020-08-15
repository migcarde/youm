import 'package:youm/src/models/DTO/tagDTO.dart';

import 'IngredientDTO.dart';

class RecipeForCreationDTO {
  String title;
  String description;
  String picture;
  int quantity;
  double calories;
  double proteins;
  double carbohydrate;
  double fat;
  String difficulty;
  double time;
  List<IngredientDTO> ingredients;
  List<TagDTO> tags;

  RecipeForCreationDTO(
      {this.title,
      this.description,
      this.picture,
      this.quantity,
      this.calories,
      this.proteins,
      this.carbohydrate,
      this.fat,
      this.difficulty,
      this.time,
      this.ingredients,
      this.tags});
}
