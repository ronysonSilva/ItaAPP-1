import 'package:flutter/material.dart';
import 'package:meu_app/componentes/hamburguer/Meus%20chamados/abrir_chamado.dart';
import 'package:meu_app/utils.dart';

class meusChamados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 844,
        decoration: BoxDecoration(
          color: Color(0xffdfe9ef),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 31,
              top: 645,
              child: Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                width: 328,
                height: 164,
                child: Align(
                  child: Container(
                    child: Text(
                      'Ajude a solucionar um problema no seu bairro',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        color: Color(0xff758492),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 31,
              top: 576,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => abrirChamado()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(60, 15, 60, 15),
                  width: 331,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment(-0.5, -1.5),
                      end: Alignment(0.4, 3),
                      colors: <Color>[Color(0xff0070ae), Color(0xff1191d8)],
                      stops: <double>[0, 1],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3316314b),
                        offset: Offset(2, 4),
                        blurRadius: 1.5,
                      ),
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(3, 3, 0, 3),
                    width: double.infinity,
                    height: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          width: 24,
                          height: 24,
                          child: Image.asset(
                            'assets/images/icons/key_icon.png',
                            width: 24,
                            height: 24,
                          ),
                        ),
                        Text(
                          'ABRIR CHAMADO',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            height: 1,
                            letterSpacing: 1,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 96,
              top: 361,
              child: Container(
                width: 197,
                height: 176,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 7),
                      width: 126,
                      height: 126,
                      child: Image.asset(
                        'assets/images/icons/binoculos_icon.png',
                        width: 126,
                        height: 126,
                      ),
                    ),
                    Container(
                      child: Text(
                        'Você ainda não tem um chamado aberto',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          color: Color(0xff002d55),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 181,
              top: 35,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: 179,
                height: 48,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 2, 12, 2),
                      width: 118,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 7,
                            top: 0,
                            child: Align(
                              child: SizedBox(
                                width: 111,
                                height: 28,
                                child: Text(
                                  'Olá Thiago,',
                                  textAlign: TextAlign.right,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 21,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                    color: Color(0xff002d55),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 25,
                            child: Align(
                              child: SizedBox(
                                width: 118,
                                height: 19,
                                child: Text(
                                  'Tempo limpo, 23º',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'DM Sans',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    height: 1.3,
                                    color: Color(0xff7291ac),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff009ddf),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 42,
                          height: 42,
                          child: Image.asset(
                            'assets/images/icons/user_icon.png',
                            width: 42,
                            height: 42,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 109,
              child: Container(
                width: 331,
                height: 192,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                      width: double.infinity,
                      height: 178,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            'assets/images/icons/hospital.png',
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 119,
                            child: Align(
                              child: SizedBox(
                                width: 331,
                                height: 59,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment(-0.8, 1),
                                      end: Alignment(1.6, -2.4),
                                      colors: <Color>[
                                        Color(0xff003768),
                                        Color(0x00003768)
                                      ],
                                      stops: <double>[0, 1],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            top: 129,
                            child: Align(
                              child: SizedBox(
                                width: 132,
                                height: 37,
                                child: Text(
                                  'Novo Hospital São Francisco Xavier',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2,
                                    color: Color(0xffdfe9ef),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
