// NearestMarkerButton.dart
import 'package:flutter/material.dart';

class NearestMarkerButton extends StatelessWidget {
  final Function onPressed;
  final bool isLoading;

  NearestMarkerButton({required this.onPressed, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: Colors.red),
          SizedBox(width: 8),
          isLoading
              ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
              : Text(
                  'Ponto mais próximo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
        ],
      ),
    );
  }
}
