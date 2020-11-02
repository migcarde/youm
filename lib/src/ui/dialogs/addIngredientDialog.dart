import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youm/generated/l10n.dart';
import 'package:youm/src/models/DTO/creation/ingredientForCreationDTO.dart';

class AddIngredientDialog extends StatefulWidget {
  final Function(IngredientForCreationDTO ingredient) onSave;

  AddIngredientDialog(this.onSave);

  @override
  _AddIngredientDialogState createState() => _AddIngredientDialogState();
}

class _AddIngredientDialogState extends State<AddIngredientDialog> {
  var _ingredient = IngredientForCreationDTO.create();
  var _unitError = false;
  final _ingredientDialogKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).add_ingredient),
      content: Form(
        key: _ingredientDialogKey,
        child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextFormField(
                validator: (value) =>
                    value.length == 0 ? S.of(context).field_required : null,
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
                    _ingredient.name = value;
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
                        validator: (value) {
                          if (value.length == 0) {
                            return S.of(context).field_required;
                          } else if (_ingredient.unit == null) {
                            return S.of(context).unit_required;
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
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
                            _ingredient.quantity = double.parse(value);
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
                        value: _ingredient.unit,
                        items: [
                          DropdownMenuItem(
                            child: Text(S.of(context).unit),
                            value: null,
                          ),
                          DropdownMenuItem(
                            child: Text(S.of(context).kg),
                            value: 'KG',
                          ),
                        ],
                        onChanged: (value) =>
                            setState(() => _ingredient.unit = value),
                      ),
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
          child: Text(S.of(context).add),
          onPressed: () {
            _ingredientDialogKey.currentState.validate();

            if (_ingredientDialogKey.currentState.validate()) {
              _ingredientDialogKey.currentState.save();
              widget.onSave(_ingredient); //Calls callback
              Navigator.pop(context);
            }
          },
        )
      ],
    );
  }
}
