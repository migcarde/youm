import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/RecipeApiProvider.dart';

class RecipeRepository {
  final recipeApiProvider = RecipeApiProvider();

  Future<PagedList> fetchRecipes({int page = 1}) =>
      recipeApiProvider.fetchRecipes(page: page);
}
