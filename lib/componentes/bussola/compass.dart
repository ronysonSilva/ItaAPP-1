import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Compass extends StatefulWidget {
  final Function(double) onHeadingChanged;

  Compass({required this.onHeadingChanged});

  @override
  _CompassState createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double? currentHeading;

  @override
  void initState() {
    super.initState();
    _initCompass();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.navigation,
          size: 50.0,
          color: Colors.blue,
        ),
        SizedBox(height: 8.0),
        Text(
          currentHeading != null
              ? "${currentHeading!.toStringAsFixed(0)}°"
              : "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

  void _initCompass() {
    FlutterCompass.events?.listen((CompassEvent event) {
      setState(() {
        currentHeading = event.heading ?? 0.0;
        widget.onHeadingChanged(currentHeading!);
      });
    });
  }
}
