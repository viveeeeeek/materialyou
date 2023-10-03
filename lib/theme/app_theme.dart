import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:provider/provider.dart';
import '../providers/app_theme_provider.dart';

// //! IMPLEMENTED DYNAMICOLOUR SWITCH WITH PROVIDER (CURRENTLY ONLY FOR DARK DYNAMIC THEME)
ColorScheme getLightColorScheme(
    BuildContext context, ColorScheme? lightDynamic) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);

  bool isDynamic = sharedPrefsProvider.isDynamiColorOn;

  try {
    if (lightDynamic != null && isDynamic == true) {
      return lightDynamic.harmonized();
    } else {
      return ColorScheme.fromSeed(
        seedColor: themeProvider.themeColor,
        brightness: Brightness.light,
      );
    }
  } catch (e) {
    print('Error getting light color scheme: $e');
    return ColorScheme.light(); // Return a default color scheme on error
  }
}

ColorScheme getDarkColorScheme(BuildContext context, ColorScheme? darkDynamic) {
  final themeProvider = Provider.of<ThemeProvider>(context);
  final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);
  bool isDynamic = sharedPrefsProvider.isDynamiColorOn;

  try {
    if (darkDynamic != null && isDynamic == true) {
      return darkDynamic.harmonized();
    } else {
      return ColorScheme.fromSeed(
        seedColor: themeProvider.themeColor,
        brightness: Brightness.dark,
      );
    }
  } catch (e) {
    print('Error getting dark color scheme: $e');
    return ColorScheme.dark(); // Return a default color scheme on error
  }
}
