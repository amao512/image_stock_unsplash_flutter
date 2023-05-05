import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  Map<String, String>? _localizedStrings;

  Future<bool> load() async {
    final jsonString = await rootBundle.loadString('assets/string/local_${locale.languageCode}.json');
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;

    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
    
    return true;
  }

  String translate(String key) {
    return _localizedStrings?[key] ?? key;
  }
}

extension LocalContextExt on BuildContext {

  String getString(String key) {
    return AppLocalizations.of(this).translate(key);
  }
}