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
  int _step = 0;
  String _value = 'EASY';
  PickedFile _image;
  var _ingredients = List<String>();
  final picker = ImagePicker();
  RecipeForCreationDTO _recipe = RecipeForCreationDTO.create();
  var stepController = TextEditingController();

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
        child: Stepper(
          type: StepperType.vertical,
          currentStep: _step,
          onStepContinue: () {
            if (_step >= 0 && _step < 2) {
              setState(() => _step++);
            }
          },
          onStepCancel: () {
            if (_step > 0 && _step < 3) {
              setState(() => _step--);
            }
          },
          steps: [
            Step(
              isActive: _step == 0,
              title: Text(S.of(context).basic_data),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _image == null
                      ? Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: OutlineButton.icon(
                            icon: Icon(Icons.photo_camera),
                            padding: EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                            onPressed: () => getImage(),
                            label: Text(S.of(context).camera),
                          ),
                        )
                      : InkWell(
                          child: Image.file(File(_image.path),
                              height: 250, fit: BoxFit.cover),
                          onTap: () => getImage(),
                        ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                  ),
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
                ],
              ),
            ),
            Step(
              isActive: _step == 1,
              title: Text(S.of(context).details),
              content: Column(
                children: [
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
                                labelText: S.of(context).quantity,
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
                    padding: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        labelText: S.of(context).preparation_time,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        var ingredient = IngredientForCreationDTO.create();
                        return AlertDialog(
                          title: Text(S.of(context).add_ingredient),
                          content: Form(
                            key: _popKey,
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: TextFormField(
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
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(S.of(context).add),
                            )
                          ],
                        );
                      },
                    ),
                    child: Text(S.of(context).add_ingredient),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Wrap(
                        children: _recipe.ingredients
                            .map(
                              (ingredient) => Padding(
                                padding: EdgeInsets.only(right: 5, left: 5),
                                child: Chip(
                                  label: Text(ingredient.name),
                                  deleteIcon: Icon(Icons.close),
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  onDeleted: () => setState(
                                    () => _ingredients.remove(ingredient),
                                  ),
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  TextFormField(
                    controller: stepController,
                    decoration: InputDecoration(
                      labelText: S.of(context).steps,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                    onEditingComplete: () => setState(
                      () => _recipe.tags.insert(0, stepController.text),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Wrap(
                      children: _recipe.tags
                          .asMap()
                          .entries
                          .map(
                            (entry) => Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.only(
                                  left: 20, right: 5, bottom: 15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${S.of(context).step} ${entry.key}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        icon: Icon(Icons.close),
                                        onPressed: () => setState(() =>
                                            _recipe.tags.removeAt(entry.key)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(entry.value),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              isActive: _step == 2,
              title: Text(S.of(context).nutritional_info),
              content: Column(
                children: [
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
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
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
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5),
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
                      ],
                    ),
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
