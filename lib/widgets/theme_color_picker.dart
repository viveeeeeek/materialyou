import 'package:flutter/material.dart';
import 'package:materialyou/providers/app_theme_provider.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  final Color containerColor;

  const CustomContainer({super.key, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      //! HERE WE USED INK WITH INKWELL TO GET RID OF DEFAULT SQUARE SHAPED INK SPLASH EEFECT FOR INKWELL WIDGET
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(60),
        ),
        child: InkWell(
          onTap: () {
            themeProvider.setThemeColor(containerColor);
            sharedPrefsProvider.saveThemeColorToPrefs(containerColor);
          },
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            height: 80,
            width: 80,
            child: Center(
              child: Container(
                width: 50.0, // Adjust the size as needed
                height: 50.0, // Adjust the size as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: containerColor, // Change this color if needed
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
