import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String buttonText;
  const CustomFilledButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
        child: Text(buttonText));
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String buttonText;
  const CustomOutlinedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Adjust the border radius
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 1.0, // Border width
        ),
      ),
      onPressed: () {},
      child: Text(
        buttonText,
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
