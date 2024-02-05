import 'package:flutter/material.dart';

class FloatingButtons extends StatelessWidget {
  final VoidCallback onDrawerButtonPressed;
  final VoidCallback onLocationButtonPressed;

  FloatingButtons({
    required this.onDrawerButtonPressed,
    required this.onLocationButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FloatingActionButton(
          onPressed: onDrawerButtonPressed,
          tooltip: 'Drawer',
          child: Icon(Icons.menu),
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}
