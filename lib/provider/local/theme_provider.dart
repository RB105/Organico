import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  void changeTheme(BuildContext context) {
    if (AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark) {
      AdaptiveTheme.of(context).setLight();
      notifyListeners();
    } else {
      AdaptiveTheme.of(context).setDark();
      notifyListeners();
    }
  }
}
