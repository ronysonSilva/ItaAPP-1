import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meu_app/utils.dart';

class Apitempo extends StatefulWidget {
  @override
  _ApitempoState createState() => _ApitempoState();
}

class _ApitempoState extends State<Apitempo> {
  User? _user;
  Map<String, dynamic> weatherData = {};

  Future<void> fetchWeatherData() async {
    try {
      final response =
          await http.get(Uri.parse('http://45.170.17.10:5000/previsao_tempo'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          weatherData = responseData;
        });
      } else {
        print('API request failed with status ${response.statusCode}');
        setState(() {
          weatherData = {'error': 'Falha ao carregar dados da API'};
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        weatherData = {'error': 'Falha ao carregar dados da API'};
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (weatherData.containsKey('error'))
          Text('Erro: ${weatherData['error']}'),
        if (!weatherData.containsKey('error'))
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Olá ${_user?.displayName?.split(" ")[0] ?? ''}',
                textAlign: TextAlign.center,
                style: SafeGoogleFont(
                  'DM Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 2,
                  color: Color.fromARGB(255, 2, 2, 2),
                ),
              ),
              Text(
                '${weatherData['weather_description']} ${weatherData['temperatura']}°C              ',
                style: SafeGoogleFont(
                  'DM Sans',
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  height: 2,
                  color: Color.fromARGB(255, 5, 5, 5),
                ),
              ),
              //Text('Umidade: ${weatherData['umidade_max']}%'),
              //Text('Umidade: ${weatherData['umidade']}%'),

              //Text('Temperatura Máxima: ${weatherData['temp_max']}°C'),
              //Text('Temperatura Mínima: ${weatherData['temp_min']}°C'),
              //Text('Velocidade do Vento: ${weatherData['wind_speed']} m/s'),
              //

              // Add other widgets as needed for additional data
            ],
          ),

        // Add other widgets as needed for additional data
      ],
    );
  }
}
