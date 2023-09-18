import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/theme/app_theme.dart';
import 'package:materialyou/theme/dynamic_color_provider.dart';
import 'package:materialyou/theme/shared_prefs_provider.dart';
import 'package:materialyou/views/login.dart';
import 'package:materialyou/views/settings.dart';
import 'package:provider/provider.dart';

bool _isDemoUsingDynamicColors = false;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => SharedPrefsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final sharedPrefsProvider =
            Provider.of<SharedPrefsProvider>(context, listen: false);
        sharedPrefsProvider.loadIsDynamicColor();

        return DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
            final lightColorScheme = getLightColorScheme(lightDynamic);
            final darkColorScheme = getDarkColorScheme(context, darkDynamic);

            return MaterialApp(
                theme: ThemeData(
                    colorScheme: lightColorScheme, useMaterial3: true),
                darkTheme:
                    ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
                home: LoginScreen());
          },
        );
      },
    );
  }
}
