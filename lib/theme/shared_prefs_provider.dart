import 'package:shared_preferences/shared_preferences.dart';

Future<bool> loadIsDynamicColorSelected() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isDynamicColorSelected') ??
      false; // Default to false if not found
}

Future<void> saveIsDynamicColorSelected(bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isDynamicColorSelected', value);
}
