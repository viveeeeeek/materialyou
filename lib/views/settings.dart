import 'package:flutter/material.dart';
import 'package:materialyou/theme/dynamic_color_provider.dart';
import 'package:materialyou/theme/shared_prefs_provider.dart';
import 'package:materialyou/widgets/color_container.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void initState() {
    super.initState();
    final sharedPrefsProvider =
        Provider.of<SharedPrefsProvider>(context, listen: false);
    sharedPrefsProvider.loadIsDynamicColor();
  }

  @override
  Widget build(BuildContext context) {
    final dynamiColorProvider = Provider.of<ThemeProvider>(context);
    final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(sharedPrefsProvider.isDynamiColor
            ? '[sharedPrefsProvider] is True'
            : '[sharedPrefsProvider] is False'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        elevation: 0, // Set the elevation to 0 for a flat AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withAlpha(20), // Change this color if needed
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Dynamic color'),
                        Switch(
                          value: sharedPrefsProvider
                              .isDynamiColor, // Set the initial value of the switch
                          onChanged: (value) {
                            // Handle switch state changes here
                            sharedPrefsProvider.isDynamiColor = !value;
                            setState(() {
                              sharedPrefsProvider.saveIsDynamicColor(
                                  value); // Update using provider
                            });
                            print(sharedPrefsProvider
                                .isDynamiColor); // Print the updated value
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: sharedPrefsProvider.isDynamiColor == false,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomContainer(containerColor: Colors.red),
                          CustomContainer(containerColor: Colors.purple),
                          CustomContainer(containerColor: Colors.teal),
                          CustomContainer(containerColor: Colors.yellow)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )

            // Add more widgets to the Column if needed
          ],
        ),
      ),
    );
  }
}
