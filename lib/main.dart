import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/homepage.dart';
import 'package:materialyou/theme/app_theme.dart';

bool _isDemoUsingDynamicColors = false;

// Fictitious brand color.
const _brandBlue = Color(0xFF1E88E5);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            final lightColorScheme = getLightColorScheme(lightDynamic);
            final darkColorScheme = getDarkColorScheme(darkDynamic);

            return MaterialApp(
                theme: ThemeData(
                  colorScheme: lightColorScheme,
                ),
                darkTheme: ThemeData(
                  colorScheme: darkColorScheme,
                ),
                home: LoginScreen(
                  isUsingDynamicColors: _isDemoUsingDynamicColors,
                ));
          },
        );
      },
    );
  }
}
