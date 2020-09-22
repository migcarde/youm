import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/generated/l10n.dart';
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
              scrollController.position.pixels &&
          recipes.currentPage < recipes.totalPages) {
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
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: InkWell(
        onTap: () =>
            {Navigator.pushNamed(context, '/recipes', arguments: recipe)},
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset(
                        'assets/icons/grey_image.png',
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 110,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 50, 5),
                              child: Text(
                                recipe.title +
                                    'dlkjfdlsak jldkf slfksdjfd  lksdj',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10, right: 40),
                              child: Text(
                                recipe.description +
                                    'fkl djalfjkfj adslkfjslk dfasjlkfadjldf jslkdj ',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, top: 5, bottom: 10),
                                child: Container(
                                  alignment: Alignment(1.0, 1.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.timer),
                                      Text(
                                        recipe.time,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color(0xFFC58DFD),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          "${recipe.quantity == 0 ? '-' : recipe.quantity} ${S.of(context).rations}",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          textAlign: TextAlign.start,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                      alignment: Alignment.center,
                      width: 80,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color(0xFFF9E853),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: setStars(3.4),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    child: Container(
                        alignment: Alignment.center,
                        width: 80,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: getDifficultyColor(recipe.difficulty),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          getDifficulty(recipe.difficulty, context),
                          style: TextStyle(color: Colors.white, fontSize: 13),
                          textAlign: TextAlign.start,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getDifficultyColor(String difficulty) {
    if (difficulty == 'EASY') {
      return Color(0xFF45BBED);
    } else if (difficulty == "AVERAGE") {
      return Color(0xFF7EDF94);
    } else {
      return Color(0xFFFF5F5F);
    }
  }

  String getDifficulty(String difficulty, BuildContext context) {
    if (difficulty == 'EASY') {
      return S.of(context).easy;
    } else if (difficulty == "AVERAGE") {
      return S.of(context).average;
    } else {
      return S.of(context).hard;
    }
  }

  List<Widget> setStars(double rating) {
    List<Widget> result = [];
    var maxStars = rating.ceil();

    for (var i = 0; i < 5; i++) {
      if (i == maxStars - 1 && rating < maxStars) {
        result.add(Icon(Icons.star_half, size: 14, color: Colors.white));
      } else if (i < maxStars) {
        result.add(Icon(Icons.star, size: 14, color: Colors.white));
      } else {
        result.add(Icon(Icons.star_outline, size: 14, color: Colors.white));
      }
    }

    return result;
  }
}
