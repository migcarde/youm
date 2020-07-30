import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/src/models/recipeModel.dart';

class RecipeDetail extends StatelessWidget {
  final RecipeModel recipe;

    RecipeDetail({Key key, @required this.recipe}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(recipe.title),), body: ,)
  }
}
