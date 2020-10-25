// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(list) => "${list} is empty";

  static m1(object) => "${object} not found";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "add" : MessageLookupByLibrary.simpleMessage("Add"),
    "add_ingredient" : MessageLookupByLibrary.simpleMessage("Add ingredient"),
    "app_title" : MessageLookupByLibrary.simpleMessage("Youm!"),
    "average" : MessageLookupByLibrary.simpleMessage("Average"),
    "calories" : MessageLookupByLibrary.simpleMessage("Calories"),
    "camera" : MessageLookupByLibrary.simpleMessage("Camera"),
    "carbohydrate" : MessageLookupByLibrary.simpleMessage("Carbohydrate"),
    "create_recipe" : MessageLookupByLibrary.simpleMessage("Create recipe"),
    "description" : MessageLookupByLibrary.simpleMessage("Description"),
    "details" : MessageLookupByLibrary.simpleMessage("Details"),
    "diet" : MessageLookupByLibrary.simpleMessage("Diet"),
    "difficulty" : MessageLookupByLibrary.simpleMessage("Difficulty"),
    "easy" : MessageLookupByLibrary.simpleMessage("Easy"),
    "emptyException" : m0,
    "fat" : MessageLookupByLibrary.simpleMessage("Fat"),
    "favorites" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "field_required" : MessageLookupByLibrary.simpleMessage("This field is required"),
    "formatException" : MessageLookupByLibrary.simpleMessage("The request has not been filled correctly. Please, check data"),
    "general_data" : MessageLookupByLibrary.simpleMessage("General data"),
    "hard" : MessageLookupByLibrary.simpleMessage("Hard"),
    "ingredients" : MessageLookupByLibrary.simpleMessage("Ingredients"),
    "kg" : MessageLookupByLibrary.simpleMessage("Kg"),
    "notFoundException" : m1,
    "nutritional_info" : MessageLookupByLibrary.simpleMessage("Nutritional information"),
    "picture" : MessageLookupByLibrary.simpleMessage("Image"),
    "preparation" : MessageLookupByLibrary.simpleMessage("Preparation"),
    "preparation_time" : MessageLookupByLibrary.simpleMessage("Preparation time"),
    "proteins" : MessageLookupByLibrary.simpleMessage("Proteins"),
    "quantity" : MessageLookupByLibrary.simpleMessage("Quantity"),
    "ration" : MessageLookupByLibrary.simpleMessage("Ration"),
    "rations" : MessageLookupByLibrary.simpleMessage("Rations"),
    "recipes" : MessageLookupByLibrary.simpleMessage("Recipes"),
    "shopping_list" : MessageLookupByLibrary.simpleMessage("Cart"),
    "socketException" : MessageLookupByLibrary.simpleMessage("You don\'t have internet o this moment. Please, try again later"),
    "step" : MessageLookupByLibrary.simpleMessage("Step"),
    "steps" : MessageLookupByLibrary.simpleMessage("Steps"),
    "tags" : MessageLookupByLibrary.simpleMessage("Tags"),
    "title" : MessageLookupByLibrary.simpleMessage("Title"),
    "title_validator" : MessageLookupByLibrary.simpleMessage("Title cannot be empty"),
    "unit" : MessageLookupByLibrary.simpleMessage("Unit"),
    "unit_required" : MessageLookupByLibrary.simpleMessage("Select an unit"),
    "unknowException" : MessageLookupByLibrary.simpleMessage("An unexcepted error was ocurred. Please, try again later"),
    "wall" : MessageLookupByLibrary.simpleMessage("Wall")
  };
}
