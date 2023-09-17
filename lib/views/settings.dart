import 'package:flutter/material.dart';
import 'package:materialyou/widgets/color_container.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        elevation: 0, // Set the elevation to 0 for a flat AppBar
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Dynamic color'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Switch(
                  value: false, // Set the initial value of the switch
                  onChanged: (value) {
                    // Handle switch state changes here
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(containerColor: Colors.red),
              CustomContainer(containerColor: Colors.purple),
              CustomContainer(containerColor: Colors.teal),
              CustomContainer(containerColor: Colors.yellow)
            ],
          ),

          // Add more widgets to the Column if needed
        ],
      ),
    );
  }
}
