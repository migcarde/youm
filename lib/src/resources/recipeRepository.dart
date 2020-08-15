import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/DTO/recipeForCreationDTO.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/RecipeApiProvider.dart';

class RecipeRepository {
  final recipeApiProvider = RecipeApiProvider();

  Future<PagedList> fetchRecipes({int page = 1}) =>
      recipeApiProvider.fetchRecipes(page: page);

  Future<PagedList> fetchAllRecipes({int page = 1}) =>
      recipeApiProvider.fetchAllRecipes(page: page);

  Future<RecipeDTO> postRecipe(RecipeForCreationDTO recipe) =>
      recipeApiProvider.postRecipe(recipe);
}
