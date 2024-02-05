// MarkerInfoModal.dart
import 'package:flutter/material.dart';

class MarkerInfoModal extends StatelessWidget {
  final String markerInfo;
  final Function onPressed;

  MarkerInfoModal({required this.markerInfo, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return _buildModalContent(context);
  }

  void _showModalContent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return _buildModalContent(context);
      },
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Material(
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações do Marcador',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              markerInfo,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => onPressed(),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              child: Text('Começar Agora'),
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, String s, Null Function() param2) {}
}
