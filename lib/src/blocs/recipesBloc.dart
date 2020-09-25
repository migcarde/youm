import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youm/src/models/DTO/creation/recipeForCreationDTO.dart';
import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/recipeRepository.dart';

final bloc = RecipesBloc();

class RecipesBloc {
  final repository = RecipeRepository();
  final recipesFetcher = PublishSubject<PagedList>();
  final recipe = PublishSubject<RecipeDTO>();

  Stream<PagedList> get allRecipes => recipesFetcher.stream;
  Stream<RecipeDTO> get postedRecipe => recipe.stream;

  fetchAllRecipes(BuildContext context, {int page = 1}) async {
    try {
      PagedList recipes = await repository.fetchAllRecipes(context, page: page);
      recipesFetcher.sink.add(recipes);
    } catch (e) {
      recipesFetcher.sink.addError(e);
    }
  }

  createRecipe(RecipeForCreationDTO recipeForCreation) async {
    RecipeDTO result = await repository.postRecipe(recipeForCreation);
    recipe.sink.add(result);
  }

  dispose() {
    recipesFetcher.close();
    recipe.close();
  }
}
