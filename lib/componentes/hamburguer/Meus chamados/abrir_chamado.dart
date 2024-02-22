import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_app/utils.dart';

class abrirChamado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        height: 892,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 55, 104),
        ),
        child: ClipRect(
          child: Stack(
            children: [
              Positioned(
                left: 30,
                top: 116.8182373047,
                child: Container(
                  width: 330,
                  height: 96,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 96,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff009ddf)),
                          color: Color(0xff002d55),
                          borderRadius: BorderRadius.circular(12.9999990463),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 56,
                                height: 56,
                                child: Image.asset(
                                  'assets/images/icons/camera01.png',
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'FOTO 1',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12.6400003433,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffdfe9ef),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 21,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 96,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff009ddf)),
                          color: Color(0xff002d55),
                          borderRadius: BorderRadius.circular(12.9999990463),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 56,
                                height: 56,
                                child: Image.asset(
                                  'assets/images/icons/camera02.png',
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'FOTO 2',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12.6400003433,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
                                    color: Color(0xffdfe9ef),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 21,
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        width: 96,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff009ddf)),
                          color: Color(0xff002d55),
                          borderRadius: BorderRadius.circular(12.9999990463),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                width: 56,
                                height: 56,
                                child: Image.asset(
                                  'assets/images/icons/camera03.png',
                                  width: 56,
                                  height: 56,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'FOTO 3',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 12.6400003433,
                                    fontWeight: FontWeight.w600,
                                    height: 1.2125,
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
                left: 20,
                top: 241,
                child: Container(
                  width: 350,
                  height: 564,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 31),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 18.8, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Assunto',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 12, 18.8, 12),
                              width: double.infinity,
                              height: 103,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Descrição do problema',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 18.8, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Endereço ',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 18.8, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Cidade',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 18.8, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'CEP',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 18.8, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Telefone de contato',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2125,
                                  color: Color(0xffb1c0d6),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(18.8, 16, 17.68, 14),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff00284c),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.fromLTRB(0, 0, 199.76, 0),
                                    child: Text(
                                      'Secretaria',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.2125,
                                        color: Color(0xffb1c0d6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 1.79),
                                    width: 14.76,
                                    height: 8.38,
                                    child: Image.asset(
                                      'assets/images/icons/expandir.png',
                                      width: 14.76,
                                      height: 8.38,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          width: double.infinity,
                          height: 70,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff62c6ff)),
                              borderRadius: BorderRadius.circular(6),
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
                                  fontSize: 16.3860034943,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125,
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
                left: 34,
                top: 46,
                child: Container(
                  width: 331,
                  height: 33,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 110, 0),
                        child: Text(
                          'Abrir chamado',
                          style: SafeGoogleFont(
                            'DM Sans',
                            fontSize: 21.4689273834,
                            fontWeight: FontWeight.w500,
                            height: 1.3025,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Container(
                          width: 33,
                          height: 33,
                          child: Image.asset(
                            'assets/images/icons/back_icon.png',
                            width: 33,
                            height: 33,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
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
                        margin: EdgeInsets.fromLTRB(0, 0, 14, 0),
                        width: 99,
                        height: 99,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/icons/rectangle-212-4xj.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
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
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                        width: 174,
                        height: 107,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 122,
                              top: 0,
                              child: Align(
                                child: SizedBox(
                                  width: 49,
                                  height: 83.18,
                                  child: Image.asset(
                                    'assets/images/icons/group-240-dHu.png',
                                    width: 49,
                                    height: 83.18,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 80,
                              top: 58,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(13, 12, 23, 5.85),
                                width: 89,
                                height: 49,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 0.15),
                                      width: double.infinity,
                                      height: 24,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0.5,
                                            top: 0,
                                            child: Align(
                                              child: SizedBox(
                                                width: 51,
                                                height: 3,
                                                child: Image.asset(
                                                  'assets/images/icons/group-236-5HD.png',
                                                  width: 51,
                                                  height: 3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
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
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.1975,
                                                    letterSpacing: 0.76,
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
                                      margin: EdgeInsets.fromLTRB(1, 0, 0, 0),
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
                            ),
                            Positioned(
                              left: 0,
                              top: 58,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(12, 12, 12, 5.85),
                                width: 77,
                                height: 49,
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.fromLTRB(1, 0, 0, 0.15),
                                      width: 52,
                                      height: 24,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            left: 0.5,
                                            top: 0,
                                            child: Align(
                                              child: SizedBox(
                                                width: 51,
                                                height: 3,
                                                child: Image.asset(
                                                  'assets/images/icons/group-236-vYs.png',
                                                  width: 51,
                                                  height: 3,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
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
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.1975,
                                                    letterSpacing: 0.76,
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
    );
  }
}
