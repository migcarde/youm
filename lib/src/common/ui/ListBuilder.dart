import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

buildListString(List<String> ingredients) {
  return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (context, index) => Wrap(
            children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 7, bottom: 7),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  alignment: Alignment.topLeft,
                  child: Padding(
                    child: Text(ingredients[index] ?? ''),
                    padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  )),
            ],
          ));
}
