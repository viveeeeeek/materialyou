import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDynamicColor = true;
  bool _isThemeColorSelected = false;
  Color _themeColor = Color.fromARGB(255, 255, 0, 0);

  bool get isDynamicColor => _isDynamicColor;
  bool get isThemeColorSelected => _isDynamicColor;
  Color get themeColor => _themeColor; // Getter for theme color

  void setIsDynamicColor(bool value) {
    _isDynamicColor = value;
    notifyListeners();
  }

  void setThemeColor(Color color) {
    _themeColor = color;
    notifyListeners();
  }

  void setIsThemeColorSelected(bool value) {
    _isThemeColorSelected = value;
    notifyListeners();
  }
}
