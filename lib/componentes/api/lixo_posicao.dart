import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LixoPositionComponentWithoutMap extends StatefulWidget {
  final void Function(Set<Marker>) onUpdateMarkers;

  LixoPositionComponentWithoutMap(
      {required this.onUpdateMarkers, required String userAvatar});

  @override
  _LixoPositionComponentWithoutMapState createState() =>
      _LixoPositionComponentWithoutMapState();
}

class _LixoPositionComponentWithoutMapState
    extends State<LixoPositionComponentWithoutMap> {
  List<Map<String, dynamic>> positions = [];
  Set<Marker> markers = {};
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _checkLocationPermissionAndFetchData();
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) => fetchData());
  }

  Future<void> _checkLocationPermissionAndFetchData() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final String apiUrl = 'http://45.170.17.10:9092/api/positions';
      final String username = 'wallace@wallace';
      final String password = '123123';

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$username:$password')),
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() async {
          positions = List<Map<String, dynamic>>.from(data);
          markers.clear();

          for (var position in positions) {
            final BitmapDescriptor carIcon = await _getResizedCarIcon();
            markers.add(
              Marker(
                markerId: MarkerId(position['id'].toString()),
                position: LatLng(position['latitude'], position['longitude']),
                icon: carIcon,
                infoWindow: InfoWindow(title: 'Carro ID ${position['id']}'),
              ),
            );
          }

          // Pass updated markers to the parent widget
          widget.onUpdateMarkers(markers);
        });

        print('Dados da API recebidos com sucesso!');
      } else {
        print('Erro ao buscar dados da API: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao fazer a solicitação HTTP: $e');
    }
  }

  Future<BitmapDescriptor> _getResizedCarIcon() async {
    final ByteData data =
        await rootBundle.load('assets/images/caminhao_lixo_icon.png');
    final Uint8List bytes = data.buffer.asUint8List();

    final codec = await instantiateImageCodec(
      bytes,
      targetHeight: 150,
      targetWidth: 150,
    );
    final FrameInfo frameInfo = await codec.getNextFrame();
    final ByteData? resizedData =
        await frameInfo.image.toByteData(format: ImageByteFormat.png);

    return BitmapDescriptor.fromBytes(resizedData!.buffer.asUint8List());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
