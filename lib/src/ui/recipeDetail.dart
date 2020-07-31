import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/src/models/recipeModel.dart';

class RecipeDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeModel recipe = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Text(recipe.description ?? ''),
      ),
    );
  }
}
