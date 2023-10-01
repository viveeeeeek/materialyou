import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:provider/provider.dart';
import '../providers/app_theme_provider.dart';

// Fictitious brand color.
const _brandColor = Colors.black;

ColorScheme getLightColorScheme(ColorScheme? lightDynamic) {
  if (lightDynamic != null) {
    return lightDynamic.harmonized();
  } else {
    // Otherwise, use the fallback scheme.
    return ColorScheme.fromSeed(
      seedColor: _brandColor,
    );
  }
}

//! IMPLEMENTED DYNAMICOLOUR SWITCH WITH PROVIDER (CURRENTLY ONLY FOR DARK DYNAMIC THEME)
ColorScheme getDarkColorScheme(BuildContext context, ColorScheme? darkDynamic) {
  ////  TAKING COLORSCHEME & BUILDCONTEXT AS INPUT BECAUSE
  ////  BUILDCONTEXT IS REQUIRED FOR PROVIDER TO WORK AND COLORSCHEME IS REQUIRED FOR DYNAMICOLOR HANDLING

  final themeProvider = Provider.of<ThemeProvider>(context);
  final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);

  bool isDynamic = sharedPrefsProvider
      .isDynamiColorOn; // Define isDynamic in the outer scope

  if (darkDynamic != null && isDynamic == true) {
    return darkDynamic.harmonized();
  } else {
    return ColorScheme.fromSeed(
      seedColor: themeProvider.themeColor,
      brightness: Brightness.dark,
    );
  }
}
