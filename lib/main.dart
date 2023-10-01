import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:materialyou/theme/app_theme.dart';
import 'package:materialyou/providers/app_theme_provider.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:materialyou/views/login.dart';
import 'package:provider/provider.dart';

bool _isDemoUsingDynamicColors = false;

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => SharedPrefsProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setThemeColor();
  }

  Future<void> _setThemeColor() async {
    const defaultThemeColor = Colors.green;

    final sharedPrefsProvider =
        Provider.of<SharedPrefsProvider>(context, listen: false);
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final color = await sharedPrefsProvider.getThemeColorFromPrefs();
    final retrieveThemeColorFromFres = color ?? defaultThemeColor;
    sharedPrefsProvider.loadIsDynamicColor();
    themeProvider.setThemeColor(retrieveThemeColorFromFres);
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        final lightColorScheme = getLightColorScheme(context, lightDynamic);
        final darkColorScheme = getDarkColorScheme(context, darkDynamic);

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
