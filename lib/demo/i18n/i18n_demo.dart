import 'package:flutter/material.dart';
import './native_demo_localizations.dart';

class I18nDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Locale _locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      // body: I18nDemoHome(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${_locale.languageCode}'),
            Text(_locale.toString()),
            Text(
              Localizations.of(context, NativeDemoLocalizations).title,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              NativeDemoLocalizations.of(context).title,
              style: Theme.of(context).textTheme.headline3,
              
            ),
          ],
        ),
      )
    );
  }
}

class I18nDemoHome extends StatefulWidget {
  @override
  _I18nDemoHomeState createState() => _I18nDemoHomeState();
}

class _I18nDemoHomeState extends State<I18nDemoHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}