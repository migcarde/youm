import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/ui/recipes.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    RecipesList(),
    Text("Hola"),
    Text("Hola"),
    Text("Hola")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).title)),
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  title: Text(S.of(context).diet)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text(S.of(context).favorites)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  title: Text(S.of(context).shopping_list)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps), title: Text(S.of(context).wall))
            ]));
  }

  void onTabTapped(int index) => setState(() {
        _currentIndex = index;
      });
}
