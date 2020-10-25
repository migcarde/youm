import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/common/ui/ListBuilder.dart';
import 'package:youm/src/models/DTO/recipeDTO.dart';

class RecipeDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  IconData _favoriteIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    final RecipeDTO recipe = ModalRoute.of(context).settings.arguments;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
                bottom: TabBar(tabs: [
                  Tab(text: S.of(context).preparation),
                  Tab(text: S.of(context).ingredients)
                ])),
            body: TabBarView(
              children: <Widget>[
                buildListString(recipe.tags.map((e) => e.name).toList()),
                buildListString(recipe.ingredients.map((e) => e.name).toList()),
              ],
            )));
  }
}
