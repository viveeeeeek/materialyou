import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dynamic_color_provider.dart';

// Fictitious brand color.
const _brandBlue = Color(0xFF1E88E5);

ColorScheme getLightColorScheme(ColorScheme? lightDynamic) {
  if (lightDynamic != null) {
    // On Android S+ devices, use the provided dynamic color scheme.
    if (kDebugMode) {
      print("lightDynamic is not null");
    }
    return lightDynamic.harmonized();
  } else {
    // Otherwise, use the fallback scheme.
    return ColorScheme.fromSeed(
      seedColor: _brandBlue,
    );
  }
}

//! IMPLEMENTED DYNAMICOLOUR SWITCH WITH PROVIDER (CURRENTLY ONLY FOR DARK DYNAMIC THEME)
ColorScheme getDarkColorScheme(BuildContext context, ColorScheme? darkDynamic) {
  //?  TAKING COLORSCHEME & BUILDCONTEXT AS INPUT BECAUSE
  //?  BUILDCONTEXT IS REQUIRED FOR PROVIDER TO WORK AND COLORSCHEME IS REQUIRED FOR DYNAMICOLOR HANDLING

  final themeProvider = Provider.of<ThemeProvider>(context);

  if (darkDynamic != null && themeProvider.isDynamicColor) {
    return darkDynamic.harmonized();
  } else {
    // Handle the case where darkDynamic is null or isDynamicColor is false.
    return ColorScheme.fromSeed(
      seedColor: themeProvider.themeColor,
      brightness: Brightness.dark,
    );
  }
}
