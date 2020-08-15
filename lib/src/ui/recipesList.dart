import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/src/blocs/recipesBloc.dart';
import 'package:youm/src/models/DTO/recipeDTO.dart';
import 'package:youm/src/models/pagedList.dart';

class RecipesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllRecipes();
    PagedList<RecipeDTO> recipes;

    return StreamBuilder(
      stream: bloc.allRecipes,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data as PagedList<RecipeDTO>;
          if (recipes == null) {
            recipes = data;
          } else {
            recipes.items.addAll(data.items);
          }
          return buildPagedList(recipes);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildPagedList(PagedList<RecipeDTO> recipes) {
    var scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        bloc.fetchAllRecipes(page: recipes.currentPage + 1);
      }
    });

    return ListView.builder(
      controller: scrollController,
      itemCount: recipes.items.length,
      itemBuilder: (context, index) {
        if (index == recipes.items.length &&
            recipes.currentPage < recipes.totalPages) {
          return Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: CircularProgressIndicator()));
        } else {
          var recipe = recipes.items[index];
          return cardBox(recipe, context);
        }
      },
    );
  }

  Widget cardBox(RecipeDTO recipe, BuildContext context) {
    return InkWell(
        onTap: () =>
            {Navigator.pushNamed(context, '/recipes', arguments: recipe)},
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
            child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 55, top: 60),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.lightGreen, width: 1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Text(
                    "${recipe.carbohydrate == 0 ? '-' : recipe.carbohydrate} car",
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.start,
                  )),
              Container(
                alignment: Alignment.bottomRight,
                child: Container(
                    margin: EdgeInsets.only(right: 20, top: 60),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.orange, width: 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                    child: Text(
                      "${recipe.proteins == 0 ? '-' : recipe.proteins} pro",
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.start,
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding:
                                EdgeInsets.only(left: 40, top: 10, bottom: 10),
                            child: Text(
                              recipe.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.start,
                            )),
                      ])),
              Container(
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  ))
            ])));
  }
}
