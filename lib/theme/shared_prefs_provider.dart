import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! Key points:
//// When saving the value in saveIsDynamicColorSelected, you should update isDynamiColor in the provider to reflect the new value.
//// This ensures that your provider reflects the current state immediately.
//// After updating the isDynamiColor value, you should call notifyListeners() to inform any listeners (like your widget in the build method) that the state has changed.
//// With these changes, your SharedPrefsProvider should work correctly, and the toggle should reflect the updated value from SharedPreferences.

class SharedPrefsProvider extends ChangeNotifier {
  bool isDynamiColor = false;

  Future<void> loadIsDynamicColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDynamiColor = prefs.getBool('isDynamicColorSelected') ?? true;
    notifyListeners(); // Notify listeners after updating the value
  }

  Future<void> saveIsDynamicColor(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDynamicColorSelected', value); // Use await here
    isDynamiColor = value; // Update the value in the provider
    notifyListeners(); // Notify listeners after updating the value
  }
}
