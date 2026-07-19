import 'package:flutter/widgets.dart';

/// Simple localization helper prepared for `en`, `es`, `pt`.
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'appTitle': 'Stream Basquet',
    },
    'es': {
      'appTitle': 'Stream Básquet',
    },
    'pt': {
      'appTitle': 'Stream Basquet',
    },
  };

  String get appTitle => _localizedValues[locale.languageCode]?['appTitle'] ?? 'Stream Basquet';

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
