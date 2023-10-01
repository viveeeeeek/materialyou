import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDynamicColor = true;
  Color _themeColor = const Color.fromARGB(255, 255, 0, 0);

  bool get isDynamicColor => _isDynamicColor;
  bool get isThemeColorSelected => _isDynamicColor;
  Color get themeColor => _themeColor; // Getter for theme color

  void setIsDynamicColor(bool value) {
    _isDynamicColor = value;
    notifyListeners();
  }

  // Modify setThemeColor to accept a Color argument
  void setThemeColor(Color? color) {
    if (color != null) {
      _themeColor = color;
      notifyListeners();
    }
  }
}
