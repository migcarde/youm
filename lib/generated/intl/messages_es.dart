// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
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
  String get localeName => 'es';

  static m0(list) => "${list} está vacía";

  static m1(object) => "${object} no encontrado";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "average" : MessageLookupByLibrary.simpleMessage("Normal"),
    "diet" : MessageLookupByLibrary.simpleMessage("Dieta"),
    "easy" : MessageLookupByLibrary.simpleMessage("Fácil"),
    "emptyException" : m0,
    "favorites" : MessageLookupByLibrary.simpleMessage("Favoritos"),
    "formatException" : MessageLookupByLibrary.simpleMessage("La petición no se ha realizado correctamente. Por favor, revise los datos enviados"),
    "hard" : MessageLookupByLibrary.simpleMessage("Difícil"),
    "ingredients" : MessageLookupByLibrary.simpleMessage("Ingredientes"),
    "notFoundException" : m1,
    "preparation" : MessageLookupByLibrary.simpleMessage("Preparación"),
    "rations" : MessageLookupByLibrary.simpleMessage("Raciones"),
    "recipes" : MessageLookupByLibrary.simpleMessage("Recetas"),
    "shopping_list" : MessageLookupByLibrary.simpleMessage("Carro"),
    "socketException" : MessageLookupByLibrary.simpleMessage("No tienes conexión a internet en este momento. Por favor, inténtelo más tarde"),
    "title" : MessageLookupByLibrary.simpleMessage("Youm!"),
    "unknowException" : MessageLookupByLibrary.simpleMessage("Ha ocurrido un error inesperado. Por favor, inténtelo más tarde"),
    "wall" : MessageLookupByLibrary.simpleMessage("Muro")
  };
}
