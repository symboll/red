import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class NativeDemoLocalizations {
  final Locale locale;

  NativeDemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };
  static NativeDemoLocalizations of(BuildContext context) {
    return Localizations.of<NativeDemoLocalizations>(
      context,
      NativeDemoLocalizations
    );
  }
  String get title {
    return _localized[locale.languageCode]['title'];
  }
}


class NativeDemoLocalizationsDelegate extends LocalizationsDelegate<NativeDemoLocalizations> {

  NativeDemoLocalizationsDelegate();

  @override
  Future<NativeDemoLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<NativeDemoLocalizations>(
      NativeDemoLocalizations(locale)
    );
  }

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<NativeDemoLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }
}
