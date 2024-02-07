import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        // onibusfreeoPq (30:907)
        width: double.infinity,
        height: 844,
        decoration: BoxDecoration(
          color: Color(0xffdfe9ef),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 70.3499984741,
              sigmaY: 70.3499984741,
            ),
            child: Stack(
              children: [
                Positioned(
                  // autogroup1yw1evF (SunYKE8GZEPZnCGkQ21yw1)
                  left: 31,
                  top: 675,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(49.5, 0, 49.5, 0),
                    width: 328,
                    height: 154,
                    child: Align(
                      // ajudeasolucionarumproblemanose (30:918)
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: 229,
                          ),
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
                  // autogroup7cusoAs (SunWKXx3PqrNekH57F7cUs)
                  left: 28,
                  top: 330,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(17, 13, 17, 14),
                    width: 337,
                    height: 59,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26141942),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupgcdhqNT (SunWe7FRgB3bxp5KyagcdH)
                          margin: EdgeInsets.fromLTRB(0, 0, 35.5, 4),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // assuntoMbh (30:938)
                                margin: EdgeInsets.fromLTRB(0, 0, 157.5, 0),
                                child: Text(
                                  'ASSUNTO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125,
                                    letterSpacing: 1.7,
                                    color: Color(0xffa6adb3),
                                  ),
                                ),
                              ),
                              Text(
                                // statusT8w (30:942)
                                'STATUS',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  letterSpacing: 1.7,
                                  color: Color(0xffa6adb3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupq8rxBaj (SunWmXCjw1oMmZCs91Q8rX)
                          margin: EdgeInsets.fromLTRB(1, 0, 22, 0),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // trocadelmpadanaruaa7DV (30:930)
                                margin: EdgeInsets.fromLTRB(0, 0, 56, 0),
                                child: Text(
                                  'Troca de Lâmpada na Rua A',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125,
                                    color: Color(0xff395064),
                                  ),
                                ),
                              ),
                              Text(
                                // emanliseoc7 (30:934)
                                'Em análise',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffd59804),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogroupdbvdwCX (SunWzmKg3ycu7CWEvXDbVD)
                  left: 28,
                  top: 394,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(17, 13, 17, 14),
                    width: 337,
                    height: 59,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26141942),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupotuki6o (SunXAqsDPW4Vu9tDdMotUK)
                          margin: EdgeInsets.fromLTRB(0, 0, 35.5, 4),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // assuntoQVR (30:939)
                                margin: EdgeInsets.fromLTRB(0, 0, 157.5, 0),
                                child: Text(
                                  'ASSUNTO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125,
                                    letterSpacing: 1.7,
                                    color: Color(0xffa6adb3),
                                  ),
                                ),
                              ),
                              Text(
                                // statusgxj (30:943)
                                'STATUS',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  letterSpacing: 1.7,
                                  color: Color(0xffa6adb3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupgehh1k7 (SunXGLi47nfZ4QGkZGgEHH)
                          margin: EdgeInsets.fromLTRB(1, 0, 26, 0),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // reparonochoYk3 (30:931)
                                margin: EdgeInsets.fromLTRB(0, 0, 127, 0),
                                child: Text(
                                  'Reparo no chão',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125,
                                    color: Color(0xff395064),
                                  ),
                                ),
                              ),
                              Text(
                                // concludoFuM (30:935)
                                'Concluído',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xff16a34a),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogroup9iy9biK (SunXSFbCtPsnfXm5R29iy9)
                  left: 28,
                  top: 458,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(17, 13, 17, 14),
                    width: 337,
                    height: 59,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26141942),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroup1dqd3aK (SunXaagfGHQ3zpHhjS1dqD)
                          margin: EdgeInsets.fromLTRB(0, 0, 35.5, 4),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // assuntoZoZ (30:940)
                                margin: EdgeInsets.fromLTRB(0, 0, 157.5, 0),
                                child: Text(
                                  'ASSUNTO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125,
                                    letterSpacing: 1.7,
                                    color: Color(0xffa6adb3),
                                  ),
                                ),
                              ),
                              Text(
                                // statusUfd (30:944)
                                'STATUS',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  letterSpacing: 1.7,
                                  color: Color(0xffa6adb3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogrouphzfmcWw (SunXeQucKPhTHomiCThzfm)
                          margin: EdgeInsets.fromLTRB(1, 0, 27, 0),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // podadearvorex51 (30:932)
                                margin: EdgeInsets.fromLTRB(0, 0, 130, 0),
                                child: Text(
                                  'Poda de arvore',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125,
                                    color: Color(0xff395064),
                                  ),
                                ),
                              ),
                              Text(
                                // recusadosBy (30:936)
                                'Recusado',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffdc3648),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogrouppvcxobR (SunXoudnfhqGvsXuSVPVcX)
                  left: 28,
                  top: 522,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(17, 13, 15, 14),
                    width: 337,
                    height: 59,
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26141942),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogrouptqjvFCX (SunXwpaGdJH8J6LQ9BTQjV)
                          margin: EdgeInsets.fromLTRB(0, 0, 37.5, 4),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // assuntoA4b (30:941)
                                margin: EdgeInsets.fromLTRB(0, 0, 157.5, 0),
                                child: Text(
                                  'ASSUNTO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125,
                                    letterSpacing: 1.7,
                                    color: Color(0xffa6adb3),
                                  ),
                                ),
                              ),
                              Text(
                                // statusri7 (30:945)
                                'STATUS',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  letterSpacing: 1.7,
                                  color: Color(0xffa6adb3),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupgzshCX5 (SunY1pTcFKotmui4TJGZsH)
                          margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // consertodecalada8vX (30:933)
                                margin: EdgeInsets.fromLTRB(0, 0, 94, 0),
                                child: Text(
                                  'Conserto de Calçada',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125,
                                    color: Color(0xff395064),
                                  ),
                                ),
                              ),
                              Text(
                                // emandamentoSgK (30:937)
                                'Em andamento',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xff02a2dd),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogroupbfqxaXd (SunYBeWZjUQSndFZPWBfQX)
                  left: 31,
                  top: 606,
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
                      // frame327mMD (30:914)
                      padding: EdgeInsets.fromLTRB(3.23, 3.23, 0, 3.23),
                      width: double.infinity,
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // buildcirclefill0wght300grad0op (30:915)
                            margin: EdgeInsets.fromLTRB(0, 0, 9.23, 0),
                            width: 24.54,
                            height: 24.54,
                            child: Image.asset(
                              'assets/page-1/images/buildcirclefill0wght300grad0opsz24-1-s5u.png',
                              width: 24.54,
                              height: 24.54,
                            ),
                          ),
                          Container(
                            // abrirchamadoAeF (30:917)
                            margin: EdgeInsets.fromLTRB(0, 1, 0, 0),
                            child: Text(
                              'ABRIR CHAMADO',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 17.6379299164,
                                fontWeight: FontWeight.w700,
                                height: 1.2125,
                                letterSpacing: 1.5874136925,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group273eZR (30:919)
                  left: 181,
                  top: 35,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      width: 179.43,
                      height: 48.23,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // group247T1 (30:927)
                            margin: EdgeInsets.fromLTRB(0, 2.07, 12.62, 2.19),
                            width: 118.59,
                            height: double.infinity,
                            child: Stack(
                              children: [
                                Positioned(
                                  // olthiagodgF (30:928)
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
                                  // tempolimpo23WV9 (30:929)
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
                            // groupnhZ (30:920)
                            padding: EdgeInsets.fromLTRB(3, 2.93, 3.23, 3.29),
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff009ddf),
                              borderRadius:
                                  BorderRadius.circular(24.1128807068),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x3f0e174a),
                                  offset: Offset(0, 3.707324028),
                                  blurRadius: 1.853662014,
                                ),
                              ],
                            ),
                            child: Center(
                              // clippathgroupsj1 (30:922)
                              child: SizedBox(
                                width: 42,
                                height: 42,
                                child: Image.asset(
                                  'assets/page-1/images/clip-path-group-BBH.png',
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
                  // meuschamadosZrj (30:946)
                  left: 46,
                  top: 303,
                  child: Align(
                    child: SizedBox(
                      width: 110,
                      height: 15,
                      child: Text(
                        'MEUS CHAMADOS',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.2125,
                          color: Color(0xff758492),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // group333f95 (30:949)
                  left: 31,
                  top: 99,
                  child: Container(
                    width: 331,
                    height: 192,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupwffzBNK (SunZAxCQyBg6zfc2XrWFfZ)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 9),
                          width: double.infinity,
                          height: 178,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.2717084885),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'assets/page-1/images/rectangle-232-bg-uUf.png',
                              ),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle249fHV (30:955)
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
                                // novohospitalsofranciscoxavierg (30:956)
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
                          // group309MZd (30:950)
                          margin: EdgeInsets.fromLTRB(0, 0, 4.23, 0),
                          width: 28.55,
                          height: 5,
                          child: Image.asset(
                            'assets/page-1/images/group-309-SaF.png',
                            width: 28.55,
                            height: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // group246Tcf (30:957)
                  left: 666,
                  top: 676,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(19, 6, 4, 6),
                    width: 310,
                    height: 133,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment(1.303, -2.293),
                        end: Alignment(-0.252, 0.805),
                        colors: <Color>[Color(0xffd9e6fa), Color(0xffccd5dd)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26060922),
                          offset: Offset(5, 10),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle212Ga7 (30:959)
                          margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                          width: 99,
                          height: 99,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/page-1/images/rectangle-212-R9m.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // autogrouptypmZZD (SunZMStvj1C7kgi8rQtYPm)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                          width: 174,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroup5gksgdq (SunZShFBbux88hGC1h5gks)
                                margin: EdgeInsets.fromLTRB(3, 0, 0, 9),
                                width: 171,
                                height: 49,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // pontodoguanabaraQpj (30:960)
                                      left: 0,
                                      top: 12.375,
                                      child: Align(
                                        child: SizedBox(
                                          width: 171,
                                          height: 19,
                                          child: Text(
                                            'Ponto do Guanabara',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 17.1983699799,
                                              fontWeight: FontWeight.w700,
                                              height: 1.104755859,
                                              color: Color(0xff0a3357),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // group2405AB (30:961)
                                      left: 119,
                                      top: 0,
                                      child: Align(
                                        child: SizedBox(
                                          width: 49,
                                          height: 49,
                                          child: Image.asset(
                                            'assets/page-1/images/group-240-rkB.png',
                                            width: 49,
                                            height: 49,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupffjbn4b (SunZWMok672AErrYddfFJB)
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                width: double.infinity,
                                height: 49,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group2396qy (30:977)
                                      margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                      padding:
                                          EdgeInsets.fromLTRB(12, 12, 12, 5.85),
                                      width: 77,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe1e9f1),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26303448),
                                            offset: Offset(0, 4),
                                            blurRadius: 1.5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // group237Yxs (30:981)
                                            margin: EdgeInsets.fromLTRB(
                                                1, 0, 0, 0.15),
                                            width: 52,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // group236gJP (30:982)
                                                  left: 0.5,
                                                  top: 0,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 51,
                                                      height: 3,
                                                      child: Image.asset(
                                                        'assets/page-1/images/group-236-zbm.png',
                                                        width: 51,
                                                        height: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // miny2b (30:987)
                                                  left: 0,
                                                  top: 1,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 52,
                                                      height: 23,
                                                      child: Text(
                                                        '3 MIN',
                                                        style: SafeGoogleFont(
                                                          'Inria Sans',
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.1975,
                                                          letterSpacing: 0.76,
                                                          color:
                                                              Color(0xff395064),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            // distanciaponto4Zq (30:979)
                                            'DISTANCIA PONTO',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 5.6338028908,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2125,
                                              color: Color(0xff787878),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // group238QNo (30:966)
                                      padding:
                                          EdgeInsets.fromLTRB(13, 12, 23, 5.85),
                                      width: 89,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe1e9f1),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26303448),
                                            offset: Offset(0, 4),
                                            blurRadius: 1.5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // group237gbD (30:970)
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 0.15),
                                            width: double.infinity,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // group2361tP (30:971)
                                                  left: 0.5,
                                                  top: 0,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 51,
                                                      height: 3,
                                                      child: Image.asset(
                                                        'assets/page-1/images/group-236-YFM.png',
                                                        width: 51,
                                                        height: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // kmiH1 (30:976)
                                                  left: 0,
                                                  top: 1,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 53,
                                                      height: 23,
                                                      child: Text(
                                                        '1,6KM',
                                                        style: SafeGoogleFont(
                                                          'Inria Sans',
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.1975,
                                                          letterSpacing: 0.76,
                                                          color:
                                                              Color(0xff395064),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // proximoonibus1X1 (30:968)
                                            margin:
                                                EdgeInsets.fromLTRB(1, 0, 0, 0),
                                            child: Text(
                                              'PROXIMO ONIBUS',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 5.6338028908,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2125,
                                                color: Color(0xff787878),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // group247K1u (30:988)
                  left: 986,
                  top: 676,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(19, 6, 4, 6),
                    width: 310,
                    height: 133,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment(1.303, -2.293),
                        end: Alignment(-0.252, 0.805),
                        colors: <Color>[Color(0xffd9e6fa), Color(0xffccd5dd)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26060922),
                          offset: Offset(5, 10),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle212X7y (30:990)
                          margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                          width: 99,
                          height: 99,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/page-1/images/rectangle-212-pJw.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // autogroupgcpmRUF (SunaZViYNvbDjth2F1gCPm)
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                          width: 174,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // autogroupdkapYom (SunaeQk27ztVkFTmi7dkAP)
                                margin: EdgeInsets.fromLTRB(3, 0, 0, 9),
                                width: 171,
                                height: 49,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      // pontodoguanabaraGjm (30:991)
                                      left: 0,
                                      top: 12.375,
                                      child: Align(
                                        child: SizedBox(
                                          width: 171,
                                          height: 19,
                                          child: Text(
                                            'Ponto do Guanabara',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 17.1983699799,
                                              fontWeight: FontWeight.w700,
                                              height: 1.104755859,
                                              color: Color(0xff0a3357),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      // group240kuq (30:992)
                                      left: 119,
                                      top: 0,
                                      child: Align(
                                        child: SizedBox(
                                          width: 49,
                                          height: 49,
                                          child: Image.asset(
                                            'assets/page-1/images/group-240-WNF.png',
                                            width: 49,
                                            height: 49,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupsujbSnf (SunaiQdMk2RGE4qS2ESuJB)
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                width: double.infinity,
                                height: 49,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // group239y1u (30:1008)
                                      margin: EdgeInsets.fromLTRB(0, 0, 3, 0),
                                      padding:
                                          EdgeInsets.fromLTRB(12, 12, 12, 5.85),
                                      width: 77,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe1e9f1),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26303448),
                                            offset: Offset(0, 4),
                                            blurRadius: 1.5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // group237cqZ (30:1012)
                                            margin: EdgeInsets.fromLTRB(
                                                1, 0, 0, 0.15),
                                            width: 52,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // group2369ab (30:1013)
                                                  left: 0.5,
                                                  top: 0,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 51,
                                                      height: 3,
                                                      child: Image.asset(
                                                        'assets/page-1/images/group-236-qvT.png',
                                                        width: 51,
                                                        height: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // mindVm (30:1018)
                                                  left: 0,
                                                  top: 1,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 52,
                                                      height: 23,
                                                      child: Text(
                                                        '3 MIN',
                                                        style: SafeGoogleFont(
                                                          'Inria Sans',
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.1975,
                                                          letterSpacing: 0.76,
                                                          color:
                                                              Color(0xff395064),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            // distanciapontoX5M (30:1010)
                                            'DISTANCIA PONTO',
                                            style: SafeGoogleFont(
                                              'Inter',
                                              fontSize: 5.6338028908,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2125,
                                              color: Color(0xff787878),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      // group238efm (30:997)
                                      padding:
                                          EdgeInsets.fromLTRB(13, 12, 23, 5.85),
                                      width: 89,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xffe1e9f1),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x26303448),
                                            offset: Offset(0, 4),
                                            blurRadius: 1.5,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            // group237JkK (30:1001)
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 0, 0.15),
                                            width: double.infinity,
                                            height: 24,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // group236pTm (30:1002)
                                                  left: 0.5,
                                                  top: 0,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 51,
                                                      height: 3,
                                                      child: Image.asset(
                                                        'assets/page-1/images/group-236-Uy1.png',
                                                        width: 51,
                                                        height: 3,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // kmHs9 (30:1007)
                                                  left: 0,
                                                  top: 1,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 53,
                                                      height: 23,
                                                      child: Text(
                                                        '1,6KM',
                                                        style: SafeGoogleFont(
                                                          'Inria Sans',
                                                          fontSize: 19,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          height: 1.1975,
                                                          letterSpacing: 0.76,
                                                          color:
                                                              Color(0xff395064),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            // proximoonibusNdh (30:999)
                                            margin:
                                                EdgeInsets.fromLTRB(1, 0, 0, 0),
                                            child: Text(
                                              'PROXIMO ONIBUS',
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 5.6338028908,
                                                fontWeight: FontWeight.w700,
                                                height: 1.2125,
                                                color: Color(0xff787878),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // group30363u (30:1019)
                  left: 0,
                  top: 797,
                  child: Align(
                    child: SizedBox(
                      width: 390,
                      height: 47,
                      child: Image.asset(
                        'assets/page-1/images/group-303-cBu.png',
                        width: 390,
                        height: 47,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
