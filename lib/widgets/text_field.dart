import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textfieldLabel, //required field
    this.textfieldHintText = "", // Provide a default value
    this.textfieldPrefixIcon,
    this.isPassword = false, // No need to provide a default value
  });

  final String textfieldLabel;
  final String textfieldHintText;
  final Icon? textfieldPrefixIcon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Theme.of(context).colorScheme.primary),
      obscureText: isPassword, // Set obscureText for password field
      decoration: InputDecoration(
          labelText: textfieldLabel, // Label text
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          hintText: textfieldHintText, // Hint text
          prefixIcon: textfieldPrefixIcon, // Leading icon
          prefixIconColor: Theme.of(context).colorScheme.onSurfaceVariant,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(30.0), // Border when not focused
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.outline),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0), // Border when focused
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
          ),
          floatingLabelBehavior:
              FloatingLabelBehavior.auto, // Make label floating
          hintStyle:
              TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
    );
  }
}
