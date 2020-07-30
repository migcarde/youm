import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/src/blocs/recipesBloc.dart';
import 'package:youm/src/models/pagedList.dart';
import 'package:youm/src/models/recipeModel.dart';

class RecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllRecipes();
    PagedList recipes;

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
      ),
      body: StreamBuilder(
        stream: bloc.allRecipes,
        builder: (context, AsyncSnapshot<PagedList> snapshot) {
          if (snapshot.hasData) {
            if (recipes == null) {
              recipes = snapshot.data;
            } else {
              recipes.items.addAll(snapshot.data.items);
            }
            return buildList(recipes);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
    return scaffold;
  }

  Widget buildList(PagedList recipes) {
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        bloc.fetchAllRecipes(page: recipes.currentPage + 1);
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: recipes.items.length + 1,
      itemBuilder: (context, index) {
        if (index == recipes.items.length &&
            recipes.currentPage < recipes.totalPages) {
          return Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CircularProgressIndicator()));
        } else {
          var recipe = recipes.items[index] as RecipeModel;
          return cardBox(recipe);
        }
      },
    );
  }

  Widget cardBox(RecipeModel recipe) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 1),
            borderRadius: BorderRadius.circular(15.0)),
        child: Row(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Image.asset(
                          'assets/icons/fire.png',
                          color: Colors.orange,
                          width: 25,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(recipe.calories == 0
                              ? '-'
                              : recipe.calories.toString()))
                    ],
                  ))),
          Expanded(
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cardContent(recipe),
                  )))
        ]));
  }

  List<Widget> cardContent(RecipeModel recipe) {
    List<Widget> result = List<Widget>();

    var title = Text(
      recipe.title,
      style: TextStyle(color: Colors.black, fontSize: 18),
      textAlign: TextAlign.start,
    );
    result.add(title);

    if (recipe.description != null) {
      var description = Padding(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Text(
          recipe.description,
          style: TextStyle(color: Colors.orange),
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      );
      result.add(description);
    }

    var rows = Padding(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "${recipe.proteins == 0 ? '-' : recipe.proteins} pro",
              style: TextStyle(color: Colors.blue),
              textAlign: TextAlign.start,
            ),
            Text(
              "${recipe.sodium == 0 ? '-' : recipe.sodium} sod",
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.start,
            )
          ],
        ));
    result.add(rows);

    return result;
  }
}
