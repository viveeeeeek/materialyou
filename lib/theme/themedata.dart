// import 'package:dynamic_color/dynamic_color.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:materialyou/theme/dynamic_color_provider.dart';
// import 'package:provider/provider.dart';

// ThemeData getThemeData(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
// // Fictitious brand color.
//   const _brandBlue = Color(0xFF1E88E5);

//   ColorScheme getLightColorScheme(ColorScheme? lightDynamic) {
//     if (themeProvider.isDynamicColor) {
//       // On Android S+ devices, use the provided dynamic color scheme.
//       return lightDynamic.harmonized();
//     } else {
//       // Otherwise, use the fallback scheme.
//       return ColorScheme.fromSeed(
//         seedColor: _brandBlue,
//       );
//     }
//   }

//   ColorScheme getDarkColorScheme(ColorScheme? darkDynamic) {
//     if (darkDynamic != null) {

//       return darkDynamic.harmonized();
//     } else {
//       // Otherwise, use the fallback scheme.
//       return ColorScheme.fromSeed(
//         seedColor: _brandBlue,
//         brightness: Brightness.dark,
//       );
//     }
//   }
// }
