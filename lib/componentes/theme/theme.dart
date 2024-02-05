import 'package:flutter/material.dart';

void main() => runApp(theme());

class theme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Troca de Temas',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: ThemeSwitcherWidget(),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
  // Adicione outras propriedades do tema claro aqui
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  // Adicione outras propriedades do tema escuro aqui
);

class ThemeSwitcherWidget extends StatefulWidget {
  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState();
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Troca de Temas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Este é um exemplo de troca de temas em Flutter!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                toggleTheme();
              },
            ),
            Text(
              isDarkMode ? 'Tema Escuro' : 'Tema Claro',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleTheme();
        },
        child: Icon(Icons.brightness_medium),
      ),
    );
  }
}
