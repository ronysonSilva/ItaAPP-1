import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarPositionComponent extends StatefulWidget {
  @override
  _CarPositionComponentState createState() => _CarPositionComponentState();
}

class _CarPositionComponentState extends State<CarPositionComponent> {
  List<Map<String, dynamic>> positions = [];

  Future<void> fetchData() async {
    final String apiUrl = 'http://45.170.17.10:8082/api/positions';
    final String username = 'api';
    final String password = 'czGgRc89q4EkkcEdUf0Y';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Authorization': 'Basic ' + base64Encode(utf8.encode('$username:$password')),
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        positions = List<Map<String, dynamic>>.from(data);
      });
    } else {
      print('Erro ao buscar dados da API: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: positions.length,
      itemBuilder: (context, index) {
        final position = positions[index];
        return ListTile(
          title: Text('Carro ID ${position['id']}'),
          subtitle: Text('Latitude: ${position['latitude']}, Longitude: ${position['longitude']}'),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CarPositionComponent(),
  ));
}
