import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            AdaptiveTheme.of(context).toggleThemeMode();
          },
          child: Text('Changer le thème'),
        ),
      ),
    );
  }
}
