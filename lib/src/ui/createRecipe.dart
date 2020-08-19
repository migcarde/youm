import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/blocs/recipesBloc.dart';
import 'package:youm/src/models/DTO/IngredientForCreationDTO.dart';
import 'package:youm/src/models/DTO/recipeForCreationDTO.dart';

class CreateRecipe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateRecipeState();
}

class _CreateRecipeState extends State<CreateRecipe> {
  final _formKey = GlobalKey<FormState>();
  final _popKey = GlobalKey<FormState>();
  String _value = 'EASY';
  PickedFile _image;
  var _ingredients = List<String>();
  final picker = ImagePicker();
  RecipeForCreationDTO _recipe = RecipeForCreationDTO.create();

  Future getImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    setState(() => _image = pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).create_recipe)),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          padding: EdgeInsets.only(top: 10, left: 30, right: 30),
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  MaterialButton(
                    onPressed: () => getImage(),
                    child: Text("Camara"),
                  ),
                  TextFormField(
                    validator: (value) => value.trim().length == 0
                        ? S.of(context).title_validator
                        : null,
                    maxLength: 50,
                    decoration: InputDecoration(
                      labelText: S.of(context).title,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onSaved: (value) => {
                      if (value.length > 0)
                        {setState(() => _recipe.title = value)}
                    },
                  ),
                  _image == null
                      ? Text("No image")
                      : Image.file(File(_image.path)),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: S.of(context).description,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      onSaved: (value) {
                        setState(() => _recipe.description = value);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: S.of(context).ration,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              onSaved: (value) {
                                if (value.length > 0) {
                                  setState(() =>
                                      _recipe.quantity = int.parse(value));
                                }
                              },
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: S.of(context).calories,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: S.of(context).proteins,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: S.of(context).carbohydrate,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              decoration: InputDecoration(
                                labelText: S.of(context).fat,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 5),
                            padding: EdgeInsets.fromLTRB(10, 4, 10, 4),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: _value,
                              items: [
                                DropdownMenuItem(
                                  child: Text(S.of(context).easy),
                                  value: 'EASY',
                                ),
                                DropdownMenuItem(
                                  child: Text(S.of(context).average),
                                  value: 'AVERAGE',
                                ),
                                DropdownMenuItem(
                                  child: Text(S.of(context).hard),
                                  value: 'HARD',
                                ),
                              ],
                              onChanged: (value) => setState(() {
                                _value = value;
                                _recipe.difficulty = value;
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: TextFormField(
                      textInputAction: TextInputAction.go,
                      onFieldSubmitted: (value) => setState(() {
                        if (_ingredients.contains(value)) {
                          var snackbar = SnackBar(
                            content: Text("Ya contienes $value como etiqueta"),
                          );
                          Scaffold.of(context).showSnackBar(snackbar);
                        } else {
                          _ingredients.insert(0, value);
                        }
                      }),
                      decoration: InputDecoration(
                        labelText: S.of(context).ingredients,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Wrap(
                        children: _ingredients
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Chip(
                                  label: Text(e),
                                  deleteIcon: Icon(Icons.close),
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  onDeleted: () =>
                                      setState(() => _ingredients.remove(e)),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  MaterialButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        var ingredient = IngredientForCreationDTO.create();
                        return AlertDialog(
                          title: Text('Prueba'),
                          content: Form(
                            key: _popKey,
                            child: Wrap(
                              children: [
                                TextFormField(
                                    decoration: InputDecoration(
                                      labelText: S.of(context).title,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                    ),
                                    onSaved: (value) {
                                      if (value.length > 0) {
                                        ingredient.name = value;
                                      }
                                    }),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            WhitelistingTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          decoration: InputDecoration(
                                            labelText: S.of(context).ration,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                          ),
                                          onSaved: (value) {
                                            if (value.length > 0) {
                                              ingredient.quantity =
                                                  double.parse(value);
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 5),
                                        child: DropdownButton(
                                            underline: SizedBox(),
                                            value: "KG",
                                            items: [
                                              DropdownMenuItem(
                                                child: Text("KG"),
                                                value: 'KG',
                                              ),
                                            ],
                                            onChanged: (value) =>
                                                ingredient.unit = value),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                _popKey.currentState.save();
                                setState(() {
                                  _recipe.ingredients.insert(0, ingredient);
                                  _ingredients.insert(0, ingredient.name);
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text("Prueba"),
                            )
                          ],
                        );
                      },
                    ),
                    child: Text("Pop-up"),
                  ),
                  MaterialButton(
                    onPressed: () => sendData(),
                    child: Text("Enviar"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendData() {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
    }
    bloc.createRecipe(_recipe);
    StreamBuilder(
      stream: bloc.postedRecipe,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var snackbar = SnackBar(
            content: Text("Todo bien"),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        } else {
          var snackbar = SnackBar(
            content: Text("Todo mal"),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        }
      },
    );
  }
}
