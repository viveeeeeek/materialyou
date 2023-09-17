import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color containerColor;

  const CustomContainer({super.key, required this.containerColor});

  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            height: 75,
            width: 75,
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

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Container Widget'),
        ),
        body: Center(
          child: CustomContainer(
            containerColor: Colors.blue, // Specify your desired color here
          ),
        ),
      ),
    ),
  );
}
