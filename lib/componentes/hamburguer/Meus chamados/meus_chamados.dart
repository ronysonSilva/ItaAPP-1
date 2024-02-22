import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/componentes/hamburguer/Meus%20chamados/abrir_chamado.dart';
import 'package:meu_app/utils.dart';

class meusChamados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 844,
        decoration: BoxDecoration(
          color: Color(0xffdfe9ef),
        ),
        child: ClipRect(
          child: Stack(
            children: [
              Positioned(
                left: 31,
                top: 645,
                child: Container(
                  padding: EdgeInsets.fromLTRB(49.5, 0, 49.5, 0),
                  width: 328,
                  height: 164,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: Container(
                        child: Text(
                          'Ajude a solucionar um problema no seu bairro',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 14.6400003433,
                            fontWeight: FontWeight.w500,
                            height: 1.2125,
                            color: Color(0xff758492),
                          ),
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
                    padding: EdgeInsets.fromLTRB(60, 15, 60, 14),
                    width: 331,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment(-0.592, -1.571),
                        end: Alignment(0.495, 3.043),
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
                      padding: EdgeInsets.fromLTRB(3.23, 3.23, 0, 3.23),
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 9.23, 0),
                            width: 24.54,
                            height: 24.54,
                            child: Image.asset(
                              'assets/images/icons/key_icon.png',
                              width: 24.54,
                              height: 24.54,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              'ABRIR CHAMADO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 17.6379299164,
                                fontWeight: FontWeight.w700,
                                height: 1.2125,
                                letterSpacing: 1.5,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 96.5,
                top: 361,
                child: Container(
                  width: 197,
                  height: 176,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            fontSize: 17.6379299164,
                            fontWeight: FontWeight.w500,
                            height: 1.2125,
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
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: 179.43,
                    height: 48.23,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.fromLTRB(0, 2.07, 12.62, 2.19),
                          width: 118.59,
                          height: double.infinity,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 7.5854492188,
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
                                        fontSize: 21.4689273834,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3025,
                                        color: Color(0xff002d55),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 24.9694671631,
                                child: Align(
                                  child: SizedBox(
                                    width: 118,
                                    height: 19,
                                    child: Text(
                                      'Tempo limpo, 23º',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'DM Sans',
                                        fontSize: 14.4000453949,
                                        fontWeight: FontWeight.w500,
                                        height: 1.3025,
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
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f0e174a),
                                offset: Offset(0, 3.707324028),
                                blurRadius: 1.853662014,
                              ),
                            ],
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
              ),
              Positioned(
                left: 31,
                top: 109,
                child: Container(
                  width: 331,
                  height: 192,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                        width: double.infinity,
                        height: 178,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.2717084885),
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
                                        begin: Alignment(-0.858, 1),
                                        end: Alignment(1.61, -2.4),
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
                                      fontSize: 14.9045228958,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125,
                                      color: Color(0xffdfe9ef),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4.23, 0),
                        width: 28.55,
                        height: 5,
                        child: Image.asset(
                          'assets/images/icons/balls_icon.png',
                          width: 28.55,
                          height: 5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
