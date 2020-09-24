import 'package:flutter/cupertino.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/recipeApiProvider.dart';

class RecipeRepository {
  final recipeApiProvider = RecipeApiProvider();

  Future<PagedList> fetchRecipes({int page = 1}) =>
      recipeApiProvider.fetchRecipes(page: page);

  Future<PagedList> fetchAllRecipes(BuildContext context, {int page = 1}) =>
      recipeApiProvider.fetchAllRecipes(context, page: page);
}
