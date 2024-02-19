import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meu_app/utils.dart';

class Previsao {
  final String data;
  final String fraseAlvorecer;
  final String fraseManha;
  final String fraseNoite;
  final String fraseReduzida;
  final String fraseTarde;
  final String iconeAlvorecer;
  final String iconeManha;
  final String iconeNoite;
  final String iconeTarde;
  final int id;
  final double pressao;
  final int probabilidadeChuva;
  final double sensacaoTermicaMax;
  final double sensacaoTermicaMin;
  final double temperaturaMax;
  final double temperaturaMin;
  final String textoEn;
  final String textoEs;
  final String textoPt;
  final int umidadeMax;
  final int umidadeMin;
  final double uvMax;
  final double velocidadeVentoMax;
  final double velocidadeVentoMin;

  Previsao({
    required this.data,
    required this.fraseAlvorecer,
    required this.fraseManha,
    required this.fraseNoite,
    required this.fraseReduzida,
    required this.fraseTarde,
    required this.iconeAlvorecer,
    required this.iconeManha,
    required this.iconeNoite,
    required this.iconeTarde,
    required this.id,
    required this.pressao,
    required this.probabilidadeChuva,
    required this.sensacaoTermicaMax,
    required this.sensacaoTermicaMin,
    required this.temperaturaMax,
    required this.temperaturaMin,
    required this.textoEn,
    required this.textoEs,
    required this.textoPt,
    required this.umidadeMax,
    required this.umidadeMin,
    required this.uvMax,
    required this.velocidadeVentoMax,
    required this.velocidadeVentoMin,
  });

  factory Previsao.fromJson(Map<String, dynamic> json) {
    return Previsao(
      data: json['data'],
      fraseAlvorecer: json['frase_alvorecer'],
      fraseManha: json['frase_manha'],
      fraseNoite: json['frase_noite'],
      fraseReduzida: json['frase_reduzida'],
      fraseTarde: json['frase_tarde'],
      iconeAlvorecer: json['icone_alvorecer'],
      iconeManha: json['icone_manha'],
      iconeNoite: json['icone_noite'],
      iconeTarde: json['icone_tarde'],
      id: json['id'],
      pressao: json['pressao'],
      probabilidadeChuva: json['probabilidde_chuva'],
      sensacaoTermicaMax: json['sensacao_termica_max'],
      sensacaoTermicaMin: json['sensacao_termica_min'],
      temperaturaMax: json['temperatura_max'],
      temperaturaMin: json['temperatura_min'],
      textoEn: json['texto_en'],
      textoEs: json['texto_es'],
      textoPt: json['texto_pt'],
      umidadeMax: json['umidade_max'],
      umidadeMin: json['umidade_min'],
      uvMax: json['uv_max'],
      velocidadeVentoMax: json['velocidade_vento_max'],
      velocidadeVentoMin: json['velocidade_vento_min'],
    );
  }
}

Future<List<Previsao>> fetchPrevisoes() async {
  final response =
      await http.get(Uri.parse('http://45.170.17.10:5000/previsao_tempo'));
  if (response.statusCode == 200) {
    final List<dynamic> previsoesJson = jsonDecode(response.body)['previsoes'];
    return previsoesJson.map((json) => Previsao.fromJson(json)).toList();
  } else {
    throw Exception('Falha ao carregar previsões');
  }
}

class PrevisaoWidget extends StatelessWidget {
  final Previsao previsao;

  PrevisaoWidget({required this.previsao});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(previsao.data),
          Text(previsao.fraseAlvorecer),
          Text(previsao.fraseManha),
          // Adicione os outros campos que deseja exibir
        ],
      ),
    );
  }
}

class ListaPrevisoesWidget extends StatelessWidget {
  final List<Previsao> previsoes;

  ListaPrevisoesWidget({required this.previsoes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: previsoes.length,
      itemBuilder: (context, index) {
        return PrevisaoWidget(previsao: previsoes[index]);
      },
    );
  }
}
