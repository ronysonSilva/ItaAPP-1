import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:typed_data' as ui;
import 'dart:ui' as ui;
import 'dart:io';

import 'package:flutter/painting.dart' as ui;
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';

class CustomMapMarker extends StatefulWidget {
  final File? userImage;
  final bool followUser;
  final double currentHeading;

  CustomMapMarker({
    this.userImage,
    required this.followUser,
    required this.currentHeading, required LatLng busLocation,
  });

  @override
  _CustomMapMarkerState createState() => _CustomMapMarkerState();
}

class _CustomMapMarkerState extends State<CustomMapMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your UI here (e.g., image, text, etc.)
      child: Center(
        child: Text('Custom Map Marker Component'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // You can call your initialization or data loading methods here if needed
  }

  Future<Uint8List> _obterIconeDeUsuarioRedimensionado(File userImage) async {
    final Uint8List bytes = await userImage.readAsBytes();
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetHeight: 100,
      targetWidth: 100,
    );
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    final ui.ByteData? resizedData =
        await frameInfo.image.toByteData(format: ui.ImageByteFormat.png);
    return resizedData!.buffer.asUint8List();
  }

  Future<Uint8List> _obterIconeDeUsuarioRedimensionadoCominicial(
      String avatarInitial) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final ui.Canvas canvas = ui.Canvas(pictureRecorder);
    final ui.Paint paintCircle = ui.Paint()..color = Colors.blue;
    final ui.TextPainter textPainter = ui.TextPainter(
      text: ui.TextSpan(
        text: avatarInitial,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: ui.TextDirection.ltr,
    );
    canvas.drawCircle(ui.Offset(50, 50), 50, paintCircle);
    textPainter.layout();
    textPainter.paint(
        canvas,
        ui.Offset(
            (100 - textPainter.width) / 2, (100 - textPainter.height) / 2));
    final ui.Image img = await pictureRecorder.endRecording().toImage(100, 100);
    final ui.ByteData? data =
        await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  String _gerarAvatarUsuario() {
    // Replace this with your actual logic for generating the user's avatar
    return 'A'; // Placeholder value
  }

  // Example usage of resizing image or generating avatar
  Future<void> _exemploDeUso() async {
    if (widget.userImage != null) {
      final Uint8List resizedBytes =
          await _obterIconeDeUsuarioRedimensionado(widget.userImage!);
      // Use resizedBytes as needed
    } else {
      final Uint8List defaultBytes =
          await _obterIconeDeUsuarioRedimensionadoCominicial(
              _gerarAvatarUsuario());
      // Use defaultBytes as needed
    }
  }
}
