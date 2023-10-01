import 'package:flutter/material.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:materialyou/widgets/theme_color_picker.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    final sharedPrefsProvider =
        Provider.of<SharedPrefsProvider>(context, listen: false);
    sharedPrefsProvider.loadIsDynamicColor();
  }

  @override
  Widget build(BuildContext context) {
    final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(sharedPrefsProvider.isDynamiColorOn
            ? '[sharedPrefsProvider] is True'
            : '[sharedPrefsProvider] is False'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                        const Text('Dynamic color'),
                        Switch(
                          value: sharedPrefsProvider
                              .isDynamiColorOn, // Set the initial value of the switch
                          onChanged: (value) {
                            // Handle switch state changes here
                            sharedPrefsProvider.isDynamiColorOn = !value;
                            setState(() {
                              sharedPrefsProvider.saveIsDynamicColor(
                                  value); // Update using provider
                            });
                          },
                        ),
                      ],
                    ),
                    Visibility(
                      visible: sharedPrefsProvider.isDynamiColorOn == false,
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
          ],
        ),
      ),
    );
  }
}
