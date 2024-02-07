import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/utils.dart';

class chamados extends StatelessWidget {
  chamados(String s);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // onibusfrees55 (30:1027)
        width: double.infinity,
        height: 892 * fem,
        decoration: BoxDecoration(
          color: Color(0xffdfe9ef),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 70.3499984741 * fem,
              sigmaY: 70.3499984741 * fem,
            ),
            child: Stack(
              children: [
                Positioned(
                  // autogroupwucwKSs (Sunc17ysHeGbSPkb7JWucw)
                  left: 30 * fem,
                  top: 116.8182373047 * fem,
                  child: Container(
                    width: 330 * fem,
                    height: 96 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogrouppyvopPd (SuncFs4JWsARTU4qWcPYvo)
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 10 * fem, 20 * fem, 14 * fem),
                          width: 96 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff009ddf)),
                            color: Color(0xff002d55),
                            borderRadius:
                                BorderRadius.circular(12.9999990463 * fem),
                          ),
                          child: Container(
                            // frame328jFh (30:1029)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // photocamerafill0wght300grad0op (30:1030)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 56 * fem,
                                  height: 56 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/photocamerafill0wght300grad0opsz24-1-MJB.png',
                                    width: 56 * fem,
                                    height: 56 * fem,
                                  ),
                                ),
                                Container(
                                  // foto1yA3 (30:1032)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'FOTO 1',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12.6400003433 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xffdfe9ef),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 21 * fem,
                        ),
                        Container(
                          // autogrouphv5meX5 (SuncN7NtoHJcxRxokRHV5M)
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 10 * fem, 20 * fem, 14 * fem),
                          width: 96 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff009ddf)),
                            color: Color(0xff002d55),
                            borderRadius:
                                BorderRadius.circular(12.9999990463 * fem),
                          ),
                          child: Container(
                            // frame329x1y (30:1063)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // photocamerafill0wght300grad0op (30:1064)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 56 * fem,
                                  height: 56 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/photocamerafill0wght300grad0opsz24-1-m3H.png',
                                    width: 56 * fem,
                                    height: 56 * fem,
                                  ),
                                ),
                                Container(
                                  // foto2nmh (30:1066)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'FOTO 2',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12.6400003433 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xffdfe9ef),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 21 * fem,
                        ),
                        Container(
                          // autogrouppruoVRD (SuncTwYWfQNQVL8eNWPRUo)
                          padding: EdgeInsets.fromLTRB(
                              20 * fem, 10 * fem, 20 * fem, 14 * fem),
                          width: 96 * fem,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff009ddf)),
                            color: Color(0xff002d55),
                            borderRadius:
                                BorderRadius.circular(12.9999990463 * fem),
                          ),
                          child: Container(
                            // frame33018f (30:1068)
                            width: double.infinity,
                            height: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // photocamerafill0wght300grad0op (30:1069)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 56 * fem,
                                  height: 56 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/photocamerafill0wght300grad0opsz24-1.png',
                                    width: 56 * fem,
                                    height: 56 * fem,
                                  ),
                                ),
                                Container(
                                  // foto3Szf (30:1071)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  child: Text(
                                    'FOTO 3',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12.6400003433 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                      color: Color(0xffdfe9ef),
                                    ),
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
                Positioned(
                  // group332M63 (30:1033)
                  left: 20 * fem,
                  top: 241 * fem,
                  child: Container(
                    width: 350 * fem,
                    height: 564 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupyadrf6j (SundDW8G5Q8RoFWnC5YADR)
                          padding: EdgeInsets.fromLTRB(
                              10 * fem, 0 * fem, 10 * fem, 31 * fem),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // group188ydD (30:1039)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 16 * fem, 18.8 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'Assunto',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // autogrouptfcfDXZ (Sund4ksqHDXkVuG2FwtFcF)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 12 * fem, 18.8 * fem, 12 * fem),
                                width: double.infinity,
                                height: 103 * fem,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'Descrição do problema',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // group190sMD (30:1044)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 16 * fem, 18.8 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'Endereço ',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // group191j8X (30:1047)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 16 * fem, 18.8 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'Cidade',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // group323C27 (30:1050)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 16 * fem, 18.8 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'CEP',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // group324SSF (30:1053)
                                padding: EdgeInsets.fromLTRB(
                                    18.8 * fem, 16 * fem, 18.8 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Text(
                                  'Telefone de contato',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffb1c0d6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10 * fem,
                              ),
                              Container(
                                // group330JjM (30:1057)
                                padding: EdgeInsets.fromLTRB(18.8 * fem,
                                    16 * fem, 17.68 * fem, 14 * fem),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xff00284c),
                                  borderRadius: BorderRadius.circular(4 * fem),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // secretariack3 (30:1059)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 199.76 * fem, 0 * fem),
                                      child: Text(
                                        'Secretaria',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 16 * ffem,
                                          fontWeight: FontWeight.w500,
                                          height: 1.2125 * ffem / fem,
                                          color: Color(0xffb1c0d6),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // expandmorefill0wght300grad0ops (30:1060)
                                      margin: EdgeInsets.fromLTRB(0 * fem,
                                          0 * fem, 0 * fem, 1.79 * fem),
                                      width: 14.76 * fem,
                                      height: 8.38 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/expandmorefill0wght300grad0opsz24-1-NUb.png',
                                        width: 14.76 * fem,
                                        height: 8.38 * fem,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          // frame331RxP (30:1034)
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                10 * fem, 10 * fem, 10 * fem, 10 * fem),
                            width: double.infinity,
                            height: 70 * fem,
                            child: Container(
                              // frame115wA3 (30:1035)
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff62c6ff)),
                                borderRadius: BorderRadius.circular(6 * fem),
                                gradient: LinearGradient(
                                  begin: Alignment(-1.592, -7.12),
                                  end: Alignment(0.266, 3.54),
                                  colors: <Color>[
                                    Color(0xff7de7ff),
                                    Color(0xff24d7ff),
                                    Color(0xff31a7e5)
                                  ],
                                  stops: <double>[0, 0.359, 1],
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'ENVIAR CHAMADO',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 16.3860034943 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125 * ffem / fem,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // autogroupgb6tYvX (SunbsYNATtHUSpjQ6ngb6T)
                  left: 34 * fem,
                  top: 46 * fem,
                  child: Container(
                    width: 331 * fem,
                    height: 33 * fem,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // abrirchamadoTGo (30:1072)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 147 * fem, 0 * fem),
                          child: Text(
                            'Abrir chamado',
                            style: SafeGoogleFont(
                              'DM Sans',
                              fontSize: 21.4689273834 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.3025 * ffem / fem,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                        TextButton(
                          // group228Ah1 (30:1073)
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 33 * fem,
                            height: 33 * fem,
                            child: Image.asset(
                              'assets/page-1/images/group-228.png',
                              width: 33 * fem,
                              height: 33 * fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // group246hB9 (30:1076)
                  left: 666 * fem,
                  top: 676 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        19 * fem, 6 * fem, 4 * fem, 6 * fem),
                    width: 310 * fem,
                    height: 133 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      gradient: LinearGradient(
                        begin: Alignment(1.303, -2.293),
                        end: Alignment(-0.252, 0.805),
                        colors: <Color>[Color(0xffd9e6fa), Color(0xffccd5dd)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26060922),
                          offset: Offset(5 * fem, 10 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle212uo1 (30:1078)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 14 * fem, 0 * fem),
                          width: 99 * fem,
                          height: 99 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10 * fem),
                            child: Image.asset(
                              'assets/page-1/images/rectangle-212-4xj.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // autogroup6uwwRWT (Sune14egJQeqM5akAi6UWw)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 14 * fem),
                          width: 174 * fem,
                          height: 107 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // pontodoguanabarawUo (30:1079)
                                left: 3 * fem,
                                top: 12.375 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 171 * fem,
                                    height: 19 * fem,
                                    child: Text(
                                      'Ponto do Guanabara',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 17.1983699799 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.104755859 * ffem / fem,
                                        color: Color(0xff0a3357),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group240kBM (30:1080)
                                left: 122 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 49 * fem,
                                    height: 83.18 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/group-240-Ho1.png',
                                      width: 49 * fem,
                                      height: 83.18 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group238FP1 (30:1085)
                                left: 80 * fem,
                                top: 58 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      13 * fem, 12 * fem, 23 * fem, 5.85 * fem),
                                  width: 89 * fem,
                                  height: 49 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe1e9f1),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26303448),
                                        offset: Offset(0 * fem, 4 * fem),
                                        blurRadius: 1.5 * fem,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group2376uR (30:1089)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 0.15 * fem),
                                        width: double.infinity,
                                        height: 24 * fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // group236d8f (30:1090)
                                              left: 0.5 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 51 * fem,
                                                  height: 3 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/group-236-3Uo.png',
                                                    width: 51 * fem,
                                                    height: 3 * fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // kmXE3 (30:1095)
                                              left: 0 * fem,
                                              top: 1 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 53 * fem,
                                                  height: 23 * fem,
                                                  child: Text(
                                                    '1,6KM',
                                                    style: SafeGoogleFont(
                                                      'Inria Sans',
                                                      fontSize: 19 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.1975 * ffem / fem,
                                                      letterSpacing: 0.76 * fem,
                                                      color: Color(0xff395064),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // proximoonibus19D (30:1087)
                                        margin: EdgeInsets.fromLTRB(
                                            1 * fem, 0 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'PROXIMO ONIBUS',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 5.6338028908 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2125 * ffem / fem,
                                            color: Color(0xff787878),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                // group2398Dq (30:1096)
                                left: 0 * fem,
                                top: 58 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      12 * fem, 12 * fem, 12 * fem, 5.85 * fem),
                                  width: 77 * fem,
                                  height: 49 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe1e9f1),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26303448),
                                        offset: Offset(0 * fem, 4 * fem),
                                        blurRadius: 1.5 * fem,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group237xyZ (30:1100)
                                        margin: EdgeInsets.fromLTRB(1 * fem,
                                            0 * fem, 0 * fem, 0.15 * fem),
                                        width: 52 * fem,
                                        height: 24 * fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // group236hRM (30:1101)
                                              left: 0.5 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 51 * fem,
                                                  height: 3 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/group-236-VrT.png',
                                                    width: 51 * fem,
                                                    height: 3 * fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // minbWj (30:1106)
                                              left: 0 * fem,
                                              top: 1 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 52 * fem,
                                                  height: 23 * fem,
                                                  child: Text(
                                                    '3 MIN',
                                                    style: SafeGoogleFont(
                                                      'Inria Sans',
                                                      fontSize: 19 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.1975 * ffem / fem,
                                                      letterSpacing: 0.76 * fem,
                                                      color: Color(0xff395064),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        // distanciapontoV6K (30:1098)
                                        'DISTANCIA PONTO',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 5.6338028908 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2125 * ffem / fem,
                                          color: Color(0xff787878),
                                        ),
                                      ),
                                    ],
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
                Positioned(
                  // group247dCX (30:1107)
                  left: 986 * fem,
                  top: 676 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        19 * fem, 6 * fem, 4 * fem, 6 * fem),
                    width: 310 * fem,
                    height: 133 * fem,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      gradient: LinearGradient(
                        begin: Alignment(1.303, -2.293),
                        end: Alignment(-0.252, 0.805),
                        colors: <Color>[Color(0xffd9e6fa), Color(0xffccd5dd)],
                        stops: <double>[0, 1],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26060922),
                          offset: Offset(5 * fem, 10 * fem),
                          blurRadius: 2 * fem,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // rectangle21231M (30:1109)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 14 * fem, 0 * fem),
                          width: 99 * fem,
                          height: 99 * fem,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10 * fem),
                            child: Image.asset(
                              'assets/page-1/images/rectangle-212.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          // autogroupfdfzjes (SunekdERiQQrezxszHFDFZ)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 14 * fem),
                          width: 174 * fem,
                          height: 107 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // pontodoguanabara2ts (30:1110)
                                left: 3 * fem,
                                top: 12.375 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 171 * fem,
                                    height: 19 * fem,
                                    child: Text(
                                      'Ponto do Guanabara',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 17.1983699799 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.104755859 * ffem / fem,
                                        color: Color(0xff0a3357),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group240uxf (30:1111)
                                left: 122 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 49 * fem,
                                    height: 83.18 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/group-240-dHu.png',
                                      width: 49 * fem,
                                      height: 83.18 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // group238q5d (30:1116)
                                left: 80 * fem,
                                top: 58 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      13 * fem, 12 * fem, 23 * fem, 5.85 * fem),
                                  width: 89 * fem,
                                  height: 49 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe1e9f1),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26303448),
                                        offset: Offset(0 * fem, 4 * fem),
                                        blurRadius: 1.5 * fem,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group237HyD (30:1120)
                                        margin: EdgeInsets.fromLTRB(0 * fem,
                                            0 * fem, 0 * fem, 0.15 * fem),
                                        width: double.infinity,
                                        height: 24 * fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // group236owZ (30:1121)
                                              left: 0.5 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 51 * fem,
                                                  height: 3 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/group-236-5HD.png',
                                                    width: 51 * fem,
                                                    height: 3 * fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // kmJdR (30:1126)
                                              left: 0 * fem,
                                              top: 1 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 53 * fem,
                                                  height: 23 * fem,
                                                  child: Text(
                                                    '1,6KM',
                                                    style: SafeGoogleFont(
                                                      'Inria Sans',
                                                      fontSize: 19 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.1975 * ffem / fem,
                                                      letterSpacing: 0.76 * fem,
                                                      color: Color(0xff395064),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        // proximoonibusP95 (30:1118)
                                        margin: EdgeInsets.fromLTRB(
                                            1 * fem, 0 * fem, 0 * fem, 0 * fem),
                                        child: Text(
                                          'PROXIMO ONIBUS',
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 5.6338028908 * ffem,
                                            fontWeight: FontWeight.w700,
                                            height: 1.2125 * ffem / fem,
                                            color: Color(0xff787878),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                // group239UgK (30:1127)
                                left: 0 * fem,
                                top: 58 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      12 * fem, 12 * fem, 12 * fem, 5.85 * fem),
                                  width: 77 * fem,
                                  height: 49 * fem,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe1e9f1),
                                    borderRadius:
                                        BorderRadius.circular(10 * fem),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26303448),
                                        offset: Offset(0 * fem, 4 * fem),
                                        blurRadius: 1.5 * fem,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // group237LiX (30:1131)
                                        margin: EdgeInsets.fromLTRB(1 * fem,
                                            0 * fem, 0 * fem, 0.15 * fem),
                                        width: 52 * fem,
                                        height: 24 * fem,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              // group236fVu (30:1132)
                                              left: 0.5 * fem,
                                              top: 0 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 51 * fem,
                                                  height: 3 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/group-236-vYs.png',
                                                    width: 51 * fem,
                                                    height: 3 * fem,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              // minm39 (30:1137)
                                              left: 0 * fem,
                                              top: 1 * fem,
                                              child: Align(
                                                child: SizedBox(
                                                  width: 52 * fem,
                                                  height: 23 * fem,
                                                  child: Text(
                                                    '3 MIN',
                                                    style: SafeGoogleFont(
                                                      'Inria Sans',
                                                      fontSize: 19 * ffem,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height:
                                                          1.1975 * ffem / fem,
                                                      letterSpacing: 0.76 * fem,
                                                      color: Color(0xff395064),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        // distanciaponto42F (30:1129)
                                        'DISTANCIA PONTO',
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 5.6338028908 * ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2125 * ffem / fem,
                                          color: Color(0xff787878),
                                        ),
                                      ),
                                    ],
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
        ),
      ),
    );
  }
}
