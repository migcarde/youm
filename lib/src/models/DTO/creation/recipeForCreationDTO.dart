import 'package:youm/src/models/DTO/creation/ingredientForCreationDTO.dart';
import 'package:youm/src/models/DTO/creation/tagForCreationDTO.dart';

class RecipeForCreationDTO {
  String title;
  String description;
  String picture;
  int quantity = 0;
  double calories = 0;
  double proteins = 0;
  double carbohydrate = 0;
  double fat = 0;
  double rating = 0;
  String difficulty;
  String time;
  List<IngredientForCreationDTO> ingredients = List<IngredientForCreationDTO>();
  List<TagForCreationDTO> tags = List<TagForCreationDTO>();
  List<String> directions = List<String>();

  RecipeForCreationDTO(
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
      this.tags,
      this.directions});

  RecipeForCreationDTO.create();

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
        'tags': tags,
        'directions': directions
      };
}
