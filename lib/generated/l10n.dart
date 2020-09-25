// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Preparation`
  String get preparation {
    return Intl.message(
      'Preparation',
      name: 'preparation',
      desc: '',
      args: [],
    );
  }

  /// `Ingredients`
  String get ingredients {
    return Intl.message(
      'Ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Recetas`
  String get recipes {
    return Intl.message(
      'Recetas',
      name: 'recipes',
      desc: '',
      args: [],
    );
  }

  /// `Youm!`
  String get app_title {
    return Intl.message(
      'Youm!',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Diet`
  String get diet {
    return Intl.message(
      'Diet',
      name: 'diet',
      desc: '',
      args: [],
    );
  }

  /// `Favorites`
  String get favorites {
    return Intl.message(
      'Favorites',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get shopping_list {
    return Intl.message(
      'Cart',
      name: 'shopping_list',
      desc: '',
      args: [],
    );
  }

  /// `Wall`
  String get wall {
    return Intl.message(
      'Wall',
      name: 'wall',
      desc: '',
      args: [],
    );
  }

  /// `Create recipe`
  String get create_recipe {
    return Intl.message(
      'Create recipe',
      name: 'create_recipe',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get picture {
    return Intl.message(
      'Image',
      name: 'picture',
      desc: '',
      args: [],
    );
  }

  /// `Ration`
  String get ration {
    return Intl.message(
      'Ration',
      name: 'ration',
      desc: '',
      args: [],
    );
  }

  /// `Calories`
  String get calories {
    return Intl.message(
      'Calories',
      name: 'calories',
      desc: '',
      args: [],
    );
  }

  /// `Proteins`
  String get proteins {
    return Intl.message(
      'Proteins',
      name: 'proteins',
      desc: '',
      args: [],
    );
  }

  /// `Carbohydrate`
  String get carbohydrate {
    return Intl.message(
      'Carbohydrate',
      name: 'carbohydrate',
      desc: '',
      args: [],
    );
  }

  /// `Fat`
  String get fat {
    return Intl.message(
      'Fat',
      name: 'fat',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty`
  String get difficulty {
    return Intl.message(
      'Difficulty',
      name: 'difficulty',
      desc: '',
      args: [],
    );
  }

  /// `Preparation time`
  String get preparation_time {
    return Intl.message(
      'Preparation time',
      name: 'preparation_time',
      desc: '',
      args: [],
    );
  }

  /// `Tags`
  String get tags {
    return Intl.message(
      'Tags',
      name: 'tags',
      desc: '',
      args: [],
    );
  }

  /// `Title cannot be empty`
  String get title_validator {
    return Intl.message(
      'Title cannot be empty',
      name: 'title_validator',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `General data`
  String get general_data {
    return Intl.message(
      'General data',
      name: 'general_data',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Nutritional information`
  String get nutritional_info {
    return Intl.message(
      'Nutritional information',
      name: 'nutritional_info',
      desc: '',
      args: [],
    );
  }

  /// `Add ingredient`
  String get add_ingredient {
    return Intl.message(
      'Add ingredient',
      name: 'add_ingredient',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Steps`
  String get steps {
    return Intl.message(
      'Steps',
      name: 'steps',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step {
    return Intl.message(
      'Step',
      name: 'step',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Select an unit`
  String get unit_required {
    return Intl.message(
      'Select an unit',
      name: 'unit_required',
      desc: '',
      args: [],
    );
  }

  /// `Kg`
  String get kg {
    return Intl.message(
      'Kg',
      name: 'kg',
      desc: '',
      args: [],
    );
  }

  /// `Easy`
  String get easy {
    return Intl.message(
      'Easy',
      name: 'easy',
      desc: '',
      args: [],
    );
  }

  /// `Average`
  String get average {
    return Intl.message(
      'Average',
      name: 'average',
      desc: '',
      args: [],
    );
  }

  /// `Hard`
  String get hard {
    return Intl.message(
      'Hard',
      name: 'hard',
      desc: '',
      args: [],
    );
  }

  /// `Rations`
  String get rations {
    return Intl.message(
      'Rations',
      name: 'rations',
      desc: '',
      args: [],
    );
  }

  /// `You don't have internet o this moment. Please, try again later`
  String get socketException {
    return Intl.message(
      'You don\'t have internet o this moment. Please, try again later',
      name: 'socketException',
      desc: '',
      args: [],
    );
  }

  /// `{object} not found`
  String notFoundException(Object object) {
    return Intl.message(
      '$object not found',
      name: 'notFoundException',
      desc: '',
      args: [object],
    );
  }

  /// `{list} is empty`
  String emptyException(Object list) {
    return Intl.message(
      '$list is empty',
      name: 'emptyException',
      desc: '',
      args: [list],
    );
  }

  /// `An unexcepted error was ocurred. Please, try again later`
  String get unknowException {
    return Intl.message(
      'An unexcepted error was ocurred. Please, try again later',
      name: 'unknowException',
      desc: '',
      args: [],
    );
  }

  /// `The request has not been filled correctly. Please, check data`
  String get formatException {
    return Intl.message(
      'The request has not been filled correctly. Please, check data',
      name: 'formatException',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'es'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}