// import 'dart:ui';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// //! Key points:
// //// When saving the value in saveIsDynamicColorSelected, you should update isDynamiColor in the provider to reflect the new value.
// //// This ensures that your provider reflects the current state immediately.
// //// After updating the isDynamiColor value, you should call notifyListeners() to inform any listeners (like your widget in the build method) that the state has changed.
// //// With these changes, your SharedPrefsProvider should work correctly, and the toggle should reflect the updated value from SharedPreferences.

// class SharedPrefsProvider extends ChangeNotifier {
//   bool isDynamiColorOn = false;

//   Future<void> loadIsDynamicColor() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     isDynamiColorOn = prefs.getBool('isDynamicColorSelected') ?? true;
//     notifyListeners(); // Notify listeners after updating the value
//   }

//   Future<void> saveIsDynamicColor(bool value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDynamicColorSelected', value); // Use await here
//     isDynamiColorOn = value; // Update the value in the provider
//     notifyListeners(); // Notify listeners after updating the value
//   }

//   // We cant directly save colo in shared preferences so we convert it.
//   Future<void> saveThemeColorToPrefs(Color color) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('red', color.red);
//     prefs.setInt('green', color.green);
//     prefs.setInt('blue', color.blue);
//     prefs.setInt('alpha', color.alpha);
//   }

//   Future<Color?> getThemeColorFromPrefs() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? red = prefs.getInt('red');
//     int? green = prefs.getInt('green');
//     int? blue = prefs.getInt('blue');
//     int? alpha = prefs.getInt('alpha');

//     if (red != null && green != null && blue != null && alpha != null) {
//       return Color.fromARGB(alpha, red, green, blue);
//     } else {
//       return null; // Return null if any color component is missing
//     }
//   }
// }

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsProvider extends ChangeNotifier {
  SharedPreferences? _prefs;
  bool isDynamiColorOn = false;

// Instead of initializing SharedPreferences in every method,
// we can create a private field to hold the shared preferences instance once and reuse it.
  Future<void> initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> loadIsDynamicColor() async {
    try {
      await initPrefs();
      isDynamiColorOn = _prefs!.getBool('isDynamicColorSelected') ?? true;
      notifyListeners();
    } catch (e) {
      // Handle exceptions (e.g., SharedPreferencesException) here
      print('Error loading dynamic color: $e');
    }
  }

  Future<void> saveIsDynamicColor(bool value) async {
    try {
      await initPrefs();
      await _prefs!.setBool('isDynamicColorSelected', value);
      isDynamiColorOn = value;
      notifyListeners();
    } catch (e) {
      // Handle exceptions (e.g., SharedPreferencesException) here
      print('Error saving dynamic color: $e');
    }
  }

  Future<void> saveThemeColorToPrefs(Color color) async {
    try {
      await initPrefs();
      _prefs!.setInt('red', color.red);
      _prefs!.setInt('green', color.green);
      _prefs!.setInt('blue', color.blue);
      _prefs!.setInt('alpha', color.alpha);
    } catch (e) {
      // Handle exceptions (e.g., SharedPreferencesException) here
      print('Error saving theme color: $e');
    }
  }

  Future<Color?> getThemeColorFromPrefs() async {
    try {
      await initPrefs();
      final red = _prefs!.getInt('red');
      final green = _prefs!.getInt('green');
      final blue = _prefs!.getInt('blue');
      final alpha = _prefs!.getInt('alpha');

      if (red != null && green != null && blue != null && alpha != null) {
        return Color.fromARGB(alpha, red, green, blue);
      } else {
        return null;
      }
    } catch (e) {
      // Handle exceptions (e.g., SharedPreferencesException) here
      print('Error loading theme color: $e');
      return null;
    }
  }
}
