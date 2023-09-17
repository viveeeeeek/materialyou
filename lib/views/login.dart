import 'package:flutter/material.dart';
import 'package:materialyou/widgets/buttons.dart';
import 'package:materialyou/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.isUsingDynamicColors});
  final bool
      isUsingDynamicColors; // Change _isUsingDynamicColors to isUsingDynamicColors

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    String dynamicMsg = isUsingDynamicColors ? ' (dynamic)' : ' (not dynamic)';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(dynamicMsg),
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
                    .withAlpha(60),
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
