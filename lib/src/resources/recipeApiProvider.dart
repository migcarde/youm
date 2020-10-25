import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/models/DTO/creation/recipeForCreationDTO.dart';
import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/failure.dart';
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

  Future<PagedList> fetchAllRecipes(BuildContext context,
      {int page = 0}) async {
    try {
      final response = await http.get(
          'https://youm20200719211256.azurewebsites.net/api/recipes?pageNumber=$page');

      var body = json.decode(response.body);
      var paginationHeader = json.decode(response.headers['x-pagination']);
      var pagination = Pagination.fromJson(paginationHeader);
      var recipes =
          body.map<RecipeDTO>((model) => RecipeDTO.fromJson(model)).toList();
      return PagedList<RecipeDTO>.fromJson(pagination, recipes);
    } on SocketException {
      throw Failure(S.of(context).socketException);
    } on HttpException {
      var recipesString = S.of(context).recipes;
      throw Failure(S.of(context).notFoundException(recipesString));
    } on FormatException {
      throw Failure(S.of(context).formatException);
    } on Exception {
      throw Failure(S.of(context).unknowException);
    }
  }

  Future<RecipeDTO> postRecipe(RecipeForCreationDTO recipeForCreation) async {
    try {
      final response = await http.post(
          'https://youm20200719211256.azurewebsites.net/api/recipes',
          body: jsonEncode(recipeForCreation),
          headers: {"content-Type": "application/json"});

      var body = json.decode(response.body);
      var recipe = RecipeDTO.fromJson(body);

      return recipe;
    } catch (e) {
      throw Failure('Fallo');
    }
  }
}
