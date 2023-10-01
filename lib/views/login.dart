import 'package:flutter/material.dart';
import 'package:materialyou/providers/shared_prefs_provider.dart';
import 'package:materialyou/views/settings.dart';
import 'package:materialyou/widgets/buttons.dart';
import 'package:materialyou/widgets/text_field.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final sharedPrefsProvider = Provider.of<SharedPrefsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(sharedPrefsProvider.isDynamiColorOn
            ? '[sharedPrefsProvider] is True'
            : '[sharedPrefsProvider] is False'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: screenSize.height / 2,
              width: screenSize.width / 1.2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withAlpha(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(
                      textfieldLabel: 'Email',
                      textfieldPrefixIcon: Icon(Icons.email_outlined),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomTextField(
                      textfieldLabel: 'Password',
                      textfieldPrefixIcon: Icon(Icons.lock_outline),
                      isPassword: true, // Set it to true for a password field
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          "Forgot your password?",
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                        height: 55,
                        width: screenSize.width,
                        child: const CustomFilledButton(buttonText: "Login")),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 55,
                        width: screenSize.width,
                        child: const CustomOutlinedButton(
                          buttonText: "Sign Up",
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
