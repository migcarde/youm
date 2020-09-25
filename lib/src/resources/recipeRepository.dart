import 'package:flutter/cupertino.dart';
import 'package:youm/src/models/DTO/creation/recipeForCreationDTO.dart';
import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/recipeApiProvider.dart';

class RecipeRepository {
  final recipeApiProvider = RecipeApiProvider();

  Future<PagedList> fetchRecipes({int page = 1}) =>
      recipeApiProvider.fetchRecipes(page: page);

  Future<PagedList> fetchAllRecipes(BuildContext context, {int page = 1}) =>
      recipeApiProvider.fetchAllRecipes(context, page: page);

  Future<RecipeDTO> postRecipe(RecipeForCreationDTO recipe) =>
      recipeApiProvider.postRecipe(recipe);
}
