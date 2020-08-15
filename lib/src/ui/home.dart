import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/ui/recipesList.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.calendar_today,
                  color: 0 == _currentIndex ? Colors.blue : Colors.black),
              onPressed: () => onTabTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.favorite,
                  color: 1 == _currentIndex ? Colors.blue : Colors.black),
              onPressed: () => onTabTapped(1),
            ),
            Container(
              height: 0,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart,
                  color: 2 == _currentIndex ? Colors.blue : Colors.black),
              onPressed: () => onTabTapped(2),
            ),
            IconButton(
                icon: Icon(Icons.apps,
                    color: 3 == _currentIndex ? Colors.blue : Colors.black),
                onPressed: () => onTabTapped(3)),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) => setState(() {
        _currentIndex = index;
      });
}
