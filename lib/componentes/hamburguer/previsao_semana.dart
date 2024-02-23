import 'package:flutter/material.dart';
import 'package:meu_app/componentes/api/api_tempo_semana.dart';

class PrevisaoSemana extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Previsões do Tempo'),
        ),
        body: FutureBuilder<List<Previsao>>(
          future: fetchPrevisoesSemana(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListaPrevisoesWidget(previsoes: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  fetchPrevisoesSemana() {}
}
