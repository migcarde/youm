import 'dart:convert';

import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/DTO/recipeForCreationDTO.dart';
import 'package:youm/src/models/headers/pagination.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/models/recipeModel.dart';

import 'package:http/http.dart' as http;

class RecipeApiProvider {
  Future<PagedList> fetchRecipes({int page = 0}) async {
    final response = await http.get(
        'https://youm20200719211256.azurewebsites.net/api/recipes?pageNumber=$page');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var paginationHeader = json.decode(response.headers['x-pagination']);
      var pagination = Pagination.fromJson(paginationHeader);
      var recipes = body
          .map<RecipeModel>((model) => RecipeModel.fromJson(model))
          .toList();
      return PagedList.fromJson(pagination, recipes);
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<PagedList> fetchAllRecipes({int page = 0}) async {
    final response = await http.get(
        'https://youm20200719211256.azurewebsites.net/api/recipes?pageNumber=$page');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var paginationHeader = json.decode(response.headers['x-pagination']);
      var pagination = Pagination.fromJson(paginationHeader);
      var recipes =
          body.map<RecipeDTO>((model) => RecipeDTO.fromJson(model)).toList();
      return PagedList<RecipeDTO>.fromJson(pagination, recipes);
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  Future<RecipeDTO> postRecipe(RecipeForCreationDTO recipeForCreation) async {
    final response = await http.post(
        'https://youm20200719211256.azurewebsites.net/api/recipes',
        body: jsonEncode(recipeForCreation),
        headers: {"content-Type": "application/json"});

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var recipe = RecipeDTO.fromJson(body);

      return recipe;
    } else {
      throw new Exception('Failed to create recipe');
    }
  }
}
