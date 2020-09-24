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
    "average" : MessageLookupByLibrary.simpleMessage("Average"),
    "diet" : MessageLookupByLibrary.simpleMessage("Diet"),
    "easy" : MessageLookupByLibrary.simpleMessage("Easy"),
    "emptyException" : m0,
    "favorites" : MessageLookupByLibrary.simpleMessage("Favorites"),
    "formatException" : MessageLookupByLibrary.simpleMessage("The request has not been filled correctly. Please, check data"),
    "hard" : MessageLookupByLibrary.simpleMessage("Hard"),
    "ingredients" : MessageLookupByLibrary.simpleMessage("Ingredients"),
    "notFoundException" : m1,
    "preparation" : MessageLookupByLibrary.simpleMessage("Preparation"),
    "rations" : MessageLookupByLibrary.simpleMessage("Rations"),
    "recipes" : MessageLookupByLibrary.simpleMessage("Recetas"),
    "shopping_list" : MessageLookupByLibrary.simpleMessage("Cart"),
    "socketException" : MessageLookupByLibrary.simpleMessage("You don\'t have internet o this moment. Please, try again later"),
    "title" : MessageLookupByLibrary.simpleMessage("Youm!"),
    "unknowException" : MessageLookupByLibrary.simpleMessage("An unexcepted error was ocurred. Please, try again later"),
    "wall" : MessageLookupByLibrary.simpleMessage("Wall")
  };
}
