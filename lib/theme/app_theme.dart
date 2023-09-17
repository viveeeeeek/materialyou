import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

ColorScheme getDarkColorScheme(ColorScheme? darkDynamic) {
  if (darkDynamic != null) {
    // On Android S+ devices, use the provided dynamic color scheme.
    if (kDebugMode) {
      print("darkDynamic is not null");
    }
    return darkDynamic.harmonized();
  } else {
    // Otherwise, use the fallback scheme.
    return ColorScheme.fromSeed(
      seedColor: _brandBlue,
      brightness: Brightness.dark,
    );
  }
}
