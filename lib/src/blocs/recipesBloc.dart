import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/recipeRepository.dart';

final bloc = RecipesBloc();

class RecipesBloc {
  final repository = RecipeRepository();
  final recipesFetcher = PublishSubject<PagedList>();

  Stream<PagedList> get allRecipes => recipesFetcher.stream;

  fetchAllRecipes(BuildContext context, {int page = 1}) async {
    try {
      PagedList recipes = await repository.fetchAllRecipes(context, page: page);
      recipesFetcher.sink.add(recipes);
    } catch (e) {
      recipesFetcher.sink.addError(e);
    }
  }

  dispose() {
    recipesFetcher.close();
  }
}
