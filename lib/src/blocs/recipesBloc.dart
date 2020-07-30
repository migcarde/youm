import 'package:rxdart/rxdart.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/resources/recipeRepository.dart';

final bloc = RecipesBloc();

class RecipesBloc {
  final repository = RecipeRepository();
  final recipesFetcher = PublishSubject<PagedList>();

  Stream<PagedList> get allRecipes => recipesFetcher.stream;

  fetchAllRecipes({int page = 1}) async {
    PagedList recipes = await repository.fetchRecipes(page: page);
    recipesFetcher.sink.add(recipes);
  }

  dispose() {
    recipesFetcher.close();
  }
}
