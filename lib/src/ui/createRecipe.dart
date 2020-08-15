import 'package:flutter/material.dart';
import 'package:youm/generated/l10n.dart';

class CreateRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).create_recipe)),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10, left: 30, right: 30),
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value.trim().length == 0
                  ? S.of(context).title_validator
                  : null,
              maxLength: 50,
              decoration: InputDecoration(labelText: S.of(context).title),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: S.of(context).description),
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: S.of(context).ration)),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      decoration:
                          InputDecoration(labelText: S.of(context).calories),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: S.of(context).proteins)),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: S.of(context).carbohydrate),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: TextFormField(
                        decoration:
                            InputDecoration(labelText: S.of(context).fat)),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text(S.of(context).easy),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text(S.of(context).average),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text(S.of(context).hard),
                          value: 3,
                        ),
                      ],
                      onChanged: (value) => setState(() => _value = value),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
