import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! Key points:
//// When saving the value in saveIsDynamicColorSelected, you should update isDynamiColor in the provider to reflect the new value.
//// This ensures that your provider reflects the current state immediately.
//// After updating the isDynamiColor value, you should call notifyListeners() to inform any listeners (like your widget in the build method) that the state has changed.
//// With these changes, your SharedPrefsProvider should work correctly, and the toggle should reflect the updated value from SharedPreferences.

class SharedPrefsProvider extends ChangeNotifier {
  bool isDynamiColorOn = false;

  Future<void> loadIsDynamicColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDynamiColorOn = prefs.getBool('isDynamicColorSelected') ?? true;
    notifyListeners(); // Notify listeners after updating the value
  }

  Future<void> saveIsDynamicColor(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDynamicColorSelected', value); // Use await here
    isDynamiColorOn = value; // Update the value in the provider
    notifyListeners(); // Notify listeners after updating the value
  }

  Future<void> saveThemeColorToPrefs(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('red', color.red);
    prefs.setInt('green', color.green);
    prefs.setInt('blue', color.blue);
    prefs.setInt('alpha', color.alpha);
  }

  Future<Color?> getThemeColorFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? red = prefs.getInt('red');
    int? green = prefs.getInt('green');
    int? blue = prefs.getInt('blue');
    int? alpha = prefs.getInt('alpha');

    if (red != null && green != null && blue != null && alpha != null) {
      return Color.fromARGB(alpha, red, green, blue);
    } else {
      return null; // Return null if any color component is missing
    }
  }
}
