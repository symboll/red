
import 'package:flutter/material.dart';

class I18nDemo extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Locale _locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18n'),
        elevation: 0.0,
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_locale.languageCode}'),
            Text('${_locale.toString()}')
          ],
        ),
      )
    );
  }
}