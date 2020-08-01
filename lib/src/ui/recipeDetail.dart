import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/src/models/recipeModel.dart';

class RecipeDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  IconData _favoriteIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    final RecipeModel recipe = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(_favoriteIcon, color: Colors.red),
              onPressed: () {
                setState(() {
                  _favoriteIcon = Icons.favorite;
                });
              })
        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Text(recipe.description ?? ''),
      ),
    );
  }
}
